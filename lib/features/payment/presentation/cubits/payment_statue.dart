import 'package:fintech_app/features/payment/presentation/cubits/payment_cubit.dart';
import 'package:flutter_stripe/flutter_stripe.dart' hide PaymentMethod;

// class PaymentState {
//   final double amountPay;
//   final double receiveAmount;
//   final String payCurrency;
//   final String receiveCurrency;
//   final double feePercent;
//   final PaymentMethod selectedMethod;
//   final String selectedCardId;
//   final List<CreditCard> cards;
//   final bool isProcessing;
//   final String? lastError;

//   PaymentState({
//     required this.amountPay,
//     required this.receiveAmount,
//     required this.payCurrency,
//     required this.receiveCurrency,
//     required this.feePercent,
//     required this.selectedMethod,
//     required this.selectedCardId,
//     required this.cards,
//     required this.isProcessing,
//     this.lastError,
//   });

//   PaymentState copyWith({
//     double? amountPay,
//     double? receiveAmount,
//     String? payCurrency,
//     String? receiveCurrency,
//     double? feePercent,
//     PaymentMethod? selectedMethod,
//     String? selectedCardId,
//     List<CreditCard>? cards,
//     bool? isProcessing,
//     String? lastError,
//   }) {
//     return PaymentState(
//       amountPay: amountPay ?? this.amountPay,
//       receiveAmount: receiveAmount ?? this.receiveAmount,
//       payCurrency: payCurrency ?? this.payCurrency,
//       receiveCurrency: receiveCurrency ?? this.receiveCurrency,
//       feePercent: feePercent ?? this.feePercent,
//       selectedMethod: selectedMethod ?? this.selectedMethod,
//       selectedCardId: selectedCardId ?? this.selectedCardId,
//       cards: cards ?? this.cards,
//       isProcessing: isProcessing ?? this.isProcessing,
//       lastError: lastError,
//     );
//   }

//   factory PaymentState.initial() {
//     return PaymentState(
//       amountPay: 1800.0,
//       receiveAmount: 0.9876,
//       payCurrency: 'USD',
//       receiveCurrency: 'ETH',
//       feePercent: 0.05,
//       selectedMethod: PaymentMethod.card,
//       selectedCardId: 'card_1',
//       cards: [
//         CreditCard(
//           id: 'card_1',
//           holder: 'Arafat Alam',
//           number: '8629 9257 0928 3456',
//           expiry: '09/24',
//           brand: 'VISA',
//         ),
//         CreditCard(
//           id: 'card_2',
//           holder: 'Mona Dev',
//           number: '4111 1111 1111 1111',
//           expiry: '10/25',
//           brand: 'MASTERCARD',
//         ),
//       ],
//       isProcessing: false,
//       lastError: null,
//     );
//   }
// }
// lib/features/payment/presentation/cubits/payment_state.dart
// State و نماذج بسيطة (CreditCard, PaymentMethod). لا تستوردي cubit هنا.

class CreditCard {
  final String id;
  final String holder;
  final String number;
  final String expiry;
  final String brand;

  CreditCard({
    required this.id,
    required this.holder,
    required this.number,
    required this.expiry,
    required this.brand,
  });
}

enum PaymentMethod { card, googlePay, payPal, paymob, mobileBanking }

class PaymentState {
  final double amountPay;
  final double receiveAmount;
  final String payCurrency;
  final String receiveCurrency;
  final double feePercent;
  final PaymentMethod selectedMethod;
  final String selectedCardId;
  final List<CreditCard> cards;
  final bool isProcessing;
  final String? lastError;

  PaymentState({
    required this.amountPay,
    required this.receiveAmount,
    required this.payCurrency,
    required this.receiveCurrency,
    required this.feePercent,
    required this.selectedMethod,
    required this.selectedCardId,
    required this.cards,
    required this.isProcessing,
    this.lastError,
  });

  PaymentState copyWith({
    double? amountPay,
    double? receiveAmount,
    String? payCurrency,
    String? receiveCurrency,
    double? feePercent,
    PaymentMethod? selectedMethod,
    String? selectedCardId,
    List<CreditCard>? cards,
    bool? isProcessing,
    String? lastError,
  }) {
    return PaymentState(
      amountPay: amountPay ?? this.amountPay,
      receiveAmount: receiveAmount ?? this.receiveAmount,
      payCurrency: payCurrency ?? this.payCurrency,
      receiveCurrency: receiveCurrency ?? this.receiveCurrency,
      feePercent: feePercent ?? this.feePercent,
      selectedMethod: selectedMethod ?? this.selectedMethod,
      selectedCardId: selectedCardId ?? this.selectedCardId,
      cards: cards ?? this.cards,
      isProcessing: isProcessing ?? this.isProcessing,
      lastError: lastError ?? this.lastError,
    );
  }

  factory PaymentState.initial() {
    return PaymentState(
      amountPay: 1800.0,
      receiveAmount: 0.9876,
      payCurrency: 'USD',
      receiveCurrency: 'ETH',
      feePercent: 0.05,
      selectedMethod: PaymentMethod.card,
      selectedCardId: 'card_1',
      cards: [
        CreditCard(
          id: 'card_1',
          holder: 'Arafat Alam',
          number: '8629 9257 0928 3456',
          expiry: '09/24',
          brand: 'VISA',
        ),
        CreditCard(
          id: 'card_2',
          holder: 'Mona Dev',
          number: '4111 1111 1111 1111',
          expiry: '10/25',
          brand: 'MASTERCARD',
        ),
      ],
      isProcessing: false,
      lastError: null,
    );
  }
}
