
import 'package:fintech_app/features/payment/data/datasources/paymob_manger.dart';

import 'package:fintech_app/features/payment/presentation/widgets/credit_card_section.dart';
import 'package:fintech_app/features/payment/presentation/widgets/custom_bottom_sheet.dart';
import 'package:fintech_app/features/payment/presentation/widgets/email_receipt_switch.dart';
import 'package:fintech_app/features/payment/presentation/widgets/payment_app_bar.dart';
import 'package:fintech_app/features/payment/presentation/widgets/payment_buy_button.dart';
import 'package:fintech_app/features/payment/presentation/widgets/payment_methods_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

enum PaymentMethod {
  card,
  googlePay,
  mobileBanking,
}

class PaymentMethodScreen extends StatefulWidget {
  final double amount;

  const PaymentMethodScreen({
    super.key,
    required this.amount,
  });

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  PaymentMethod? _selectedMethod;
  bool _sendToEmail = false;

 
  final Color _background = const Color(0xFFF4F7FF);
  final Color _cardBackground = Colors.white;
  final Color _primaryDark = const Color(0xFF1F3C88);
  final Color _lightBox = const Color(0xFFF7F8FF);

  void _onSelectMethod(PaymentMethod method) {
    setState(() {
      _selectedMethod = method;
    });

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        final String methodText = switch (method) {
          PaymentMethod.googlePay => 'Google Pay',
          PaymentMethod.mobileBanking => 'Mobile Banking',
          PaymentMethod.card => 'Credit Card',
        };

        return CustomBottomSheet(
          methodText: methodText,
          widget: widget,
          primaryDark: _primaryDark,
        );
      },
    );
  }

  Future<void> _pay() async {
    try {
      final paymentKey = await PaymobManager().getPaymentKey(
        100,
        "EGP",
      );

      final uri = Uri.parse(
        "https://accept.paymob.com/api/acceptance/iframes/982007?payment_token=$paymentKey",
      );

      final launched = await launchUrl(uri);

      if (!launched && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open payment page. Please try again.'),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong while processing payment.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      appBar: PaymentAppBar(
        backgroundColor: _background,
        onBack: () => Navigator.pop(context),
      ),

      // ====================== BODY ======================
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 8.h),
            CreditCardSection(cardBackground: _cardBackground),
            SizedBox(height: 20.h),
            PaymentMethodsSection(
              onGooglePayTap: () => _onSelectMethod(PaymentMethod.googlePay),
              onMobileBankingTap: () =>
                  _onSelectMethod(PaymentMethod.mobileBanking),
            ),
            SizedBox(height: 24.h),
            EmailReceiptSwitchRow(
              value: _sendToEmail,
              primaryDark: _primaryDark,
              onChanged: (value) {
                setState(() {
                  _sendToEmail = value;
                });
              },
            ),
            SizedBox(height: 90.h),
          ],
        ),
      ),

      // ====================== BUY BUTTON ======================
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: PaymentBuyButton(
            primaryDark: _primaryDark,
            onPressed: _pay,
          ),
        ),
      ),
    );
  }
}
