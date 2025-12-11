import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:maps_and_themeing/constants.dart';

class PaymobManager {
  Future<String> getPaymentKey(int amount, String currency) async {
    try {
      final String authanticationToken = await _getAuthanticationToken();

      final int orderId = await _getOrderId(
        authanticationToken: authanticationToken,
        amount: (100 * amount).toString(),
        currency: currency,
      );

      final String paymentKey = await _getPaymentKey(
        authanticationToken: authanticationToken,
        amount: (100 * amount).toString(),
        currency: currency,
        orderId: orderId.toString(),
      );
      return paymentKey;
    } catch (e) {
      print('Exc==========================================');
      print(e.toString());
      throw Exception();
    }
  }

  Future<String> _getAuthanticationToken() async {
    final Response response = await Dio().post(
      'https://accept.paymob.com/api/auth/tokens',
      data: {'api_key': dotenv.env['API_KEY']},
    );
    return response.data['token'];
  }

  Future<int> _getOrderId({
    required String authanticationToken,
    required String amount,
    required String currency,
  }) async {
    final Response response = await Dio().post(
      'https://accept.paymob.com/api/ecommerce/orders',
      data: {
        'auth_token': authanticationToken,
        'amount_cents': amount, //  >>(STRING)<<
        'currency': currency, //Not Req
        'delivery_needed': 'false',
        'items': [],
      },
    );
    return response.data['id']; //INTGER
  }

  Future<String> _getPaymentKey({
    required String authanticationToken,
    required String orderId,
    required String amount,
    required String currency,
  }) async {
    final Response response = await Dio().post(
      'https://accept.paymob.com/api/acceptance/payment_keys',
      data: {
        //ALL OF THEM ARE REQIERD
        'expiration': 3600,

        'auth_token': authanticationToken, //From First Api
        'order_id': orderId, //From Second Api  >>(STRING)<<
        'integration_id':
            dotenv.env['INTEGRATION_ID'], //Integration Id Of The Payment Method

        'amount_cents': amount,
        'currency': currency,

        'billing_data': {
          //Have To Be Values
          'first_name': 'Clifford',
          'last_name': 'Nicolas',
          'email': 'claudette09@exa.com',
          'phone_number': '+86(8)9135210487',

          //Can Set "NA"
          'apartment': 'NA',
          'floor': 'NA',
          'street': 'NA',
          'building': 'NA',
          'shipping_method': 'NA',
          'postal_code': 'NA',
          'city': 'NA',
          'country': 'NA',
          'state': 'NA',
        },
      },
    );
    return response.data['token'];
  }
}
