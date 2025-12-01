import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/features/payment/presentation/widgets/build_payment_row.dart';
import 'package:flutter/material.dart';

class PaymentMethodsSection extends StatelessWidget {
  final VoidCallback onGooglePayTap;
  final VoidCallback onMobileBankingTap;

  const PaymentMethodsSection({
    super.key,
    required this.onGooglePayTap,
    required this.onMobileBankingTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkLightContainerColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          buildPaymentRow(
            title: 'Google Pay',
            onTap: onGooglePayTap,
          ),
          buildPaymentRow(
            title: 'Mobile Banking',
            onTap: onMobileBankingTap,
          ),
        ],
      ),
    );
  }
}
