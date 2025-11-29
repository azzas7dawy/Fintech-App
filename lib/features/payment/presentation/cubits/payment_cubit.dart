import 'dart:math';

import 'package:fintech_app/features/payment/presentation/cubits/payment_statue.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// lib/features/payment/presentation/cubits/payment_cubit.dart
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;


class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentState.initial());

  // Paymob config (demo only)
  String? paymobApiKey; // sandbox api key (for testing only)
  String? paymobIntegrationId; // numeric integration id from Paymob dashboard
  String? paymobIframeId; // sometimes same as integration id

  void setPaymobConfig({String? apiKey, String? integrationId, String? iframeId}) {
    if (isClosed) return;
    paymobApiKey = apiKey ?? paymobApiKey;
    paymobIntegrationId = integrationId ?? paymobIntegrationId;
    paymobIframeId = iframeId ?? paymobIframeId;
  }

  void setAmountPay(double v) {
    if (isClosed) return;
    final receive = (v / 1800.0) * 0.9876;
    emit(state.copyWith(amountPay: v, receiveAmount: receive));
  }

  void setPaymentMethod(PaymentMethod? m) {
    if (isClosed) return;
    // allow null so UI can set/unset; if null keep previous
    emit(state.copyWith(selectedMethod: m ?? state.selectedMethod));
  }

  void selectCard(String id) {
    if (isClosed) return;
    emit(state.copyWith(selectedCardId: id));
  }

  Future<bool> doMockPayment() async {
    if (isClosed) return false;
    emit(state.copyWith(isProcessing: true, lastError: null));
    await Future.delayed(const Duration(seconds: 2));
    if (isClosed) return false;
    final success = Random().nextBool();
    if (!success) {
      if (!isClosed) {
        emit(state.copyWith(isProcessing: false, lastError: 'Payment failed due to network/server error'));
      }
      return false;
    }
    if (!isClosed) emit(state.copyWith(isProcessing: false, lastError: null));
    return true;
  }

  // ----------------- Paymob client-side sandbox implementation -----------------
  // NOTE: this is for sandbox/testing only. Do NOT use client-side secret keys in production.

  Future<String?> _getPaymobAuthToken(String apiKey) async {
    try {
      final url = Uri.parse('https://accept.paymob.com/api/auth/tokens');
      final resp = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'api_key': apiKey}));
      if (resp.statusCode == 201 || resp.statusCode == 200) {
        final j = jsonDecode(resp.body);
        return j['token'] as String?;
      } else {
        debugPrint('Paymob auth error ${resp.statusCode}: ${resp.body}');
        return null;
      }
    } catch (e) {
      debugPrint('Paymob auth exception: $e');
      return null;
    }
  }

  Future<int?> _createPaymobOrder(String authToken, int amountCents, String currency) async {
    try {
      final url = Uri.parse('https://accept.paymob.com/api/ecommerce/orders');
      final body = jsonEncode({
        'auth_token': authToken,
        'delivery_needed': false,
        'amount_cents': amountCents,
        'currency': currency,
        'merchant_order_id': DateTime.now().millisecondsSinceEpoch.toString(),
      });
      final resp = await http.post(url, headers: {'Content-Type': 'application/json'}, body: body);
      if (resp.statusCode == 201 || resp.statusCode == 200) {
        final j = jsonDecode(resp.body);
        return j['id'] as int?;
      } else {
        debugPrint('Paymob create order error ${resp.statusCode}: ${resp.body}');
        return null;
      }
    } catch (e) {
      debugPrint('Paymob create order exception: $e');
      return null;
    }
  }

  Future<String?> _requestPaymentToken(String authToken, int orderId, int amountCents, Map billingData) async {
    try {
      final url = Uri.parse('https://accept.paymob.com/api/acceptance/payment_keys');
      final integration = int.tryParse(paymobIntegrationId ?? '') ?? null;
      final bodyMap = {
        'auth_token': authToken,
        'amount_cents': amountCents,
        'expiration': 3600,
        'order_id': orderId,
        'billing_data': billingData,
        'currency': 'EGP',
      };
      if (integration != null) {
        bodyMap['integration_id'] = integration;
      }
      final body = jsonEncode(bodyMap);
      final resp = await http.post(url, headers: {'Content-Type': 'application/json'}, body: body);
      if (resp.statusCode == 201 || resp.statusCode == 200) {
        final j = jsonDecode(resp.body);
        return j['token'] as String?;
      } else {
        debugPrint('Paymob payment key error ${resp.statusCode}: ${resp.body}');
        return null;
      }
    } catch (e) {
      debugPrint('Paymob payment key exception: $e');
      return null;
    }
  }

  String _buildIframeUrl(String integrationId, String paymentToken) {
    return 'https://accept.paymob.com/api/acceptance/iframes/$integrationId?payment_token=$paymentToken';
  }

  /// Public method to start Paymob flow (client-side sandbox).
  /// billingData should include fields required by Paymob (first_name, last_name, email, phone_number, etc).
  Future<String?> startPaymobFlow({
    required int amountCents,
    required String currency,
    required Map<String, dynamic> billingData,
  }) async {
    if (isClosed) return null;
    emit(state.copyWith(isProcessing: true, lastError: null));
    try {
      if (paymobApiKey == null) {
        final err = 'Paymob API key not set. Call setPaymobConfig(...) first.';
        if (!isClosed) emit(state.copyWith(isProcessing: false, lastError: err));
        return null;
      }

      // 1) get auth token
      final auth = await _getPaymobAuthToken(paymobApiKey!);
      if (auth == null) {
        final err = 'Failed to get Paymob auth token (check API key)';
        if (!isClosed) emit(state.copyWith(isProcessing: false, lastError: err));
        return null;
      }

      // 2) create order
      final orderId = await _createPaymobOrder(auth, amountCents, currency);
      if (orderId == null) {
        final err = 'Failed to create Paymob order';
        if (!isClosed) emit(state.copyWith(isProcessing: false, lastError: err));
        return null;
      }

      // 3) request payment token
      final paymentToken = await _requestPaymentToken(auth, orderId, amountCents, billingData);
      if (paymentToken == null) {
        final err = 'Failed to request Paymob payment token';
        if (!isClosed) emit(state.copyWith(isProcessing: false, lastError: err));
        return null;
      }

      // 4) build iframe url and return
      final integrationId = paymobIntegrationId ?? paymobIframeId;
      if (integrationId == null) {
        final err = 'integrationId/iframeId not configured';
        if (!isClosed) emit(state.copyWith(isProcessing: false, lastError: err));
        return null;
      }
      final iframeUrl = _buildIframeUrl(integrationId, paymentToken);
      if (!isClosed) emit(state.copyWith(isProcessing: false));
      return iframeUrl;
    } catch (e, st) {
      debugPrint('startPaymobFlow error: $e\n$st');
      if (!isClosed) emit(state.copyWith(isProcessing: false, lastError: e.toString()));
      return null;
    }
  }

  @override
  Future<void> close() {
    // cancel subscriptions/timers if you add them
    return super.close();
  }
}



// class PaymentCubit extends Cubit<PaymentState> {
//   PaymentCubit() : super(PaymentState.initial());

//   void setAmountPay(double v) {
//     final receive = (v / 1800.0) * 0.9876;
//     emit(state.copyWith(amountPay: v, receiveAmount: receive));
//   }

//   void setPaymentMethod(PaymentMethod m) {
//     emit(state.copyWith(selectedMethod: m));
//   }

//   void selectCard(String id) {
//     emit(state.copyWith(selectedCardId: id));
//   }

//   Future<bool> doMockPayment() async {
//     emit(state.copyWith(isProcessing: true, lastError: null));

//     await Future.delayed(const Duration(seconds: 2));

//     final success = Random().nextBool();
//     if (!success) {
//       emit(
//         state.copyWith(
//           isProcessing: false,
//           lastError: 'Payment failed due to network/server error',
//         ),
//       );
//       return false;
//     }

//     emit(state.copyWith(isProcessing: false, lastError: null));
//     return true;
//   }
// }

// enum PaymentMethod { card, googlePay, mobileBanking }

// class CreditCard {
//   final String id;
//   final String holder;
//   final String number;
//   final String expiry;
//   final String brand;

//   CreditCard({
//     required this.id,
//     required this.holder,
//     required this.number,
//     required this.expiry,
//     required this.brand,
//   });

//   String get maskedNumber {
//     if (number.length < 4) return number;
//     return '**** **** **** ${number.substring(number.length - 4)}';
//   }

  
// }
     