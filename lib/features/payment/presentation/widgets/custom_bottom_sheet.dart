
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/features/payment/presentation/pages/payment_method_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.methodText,
    required this.widget,
    required Color primaryDark,
  }) : _primaryDark = primaryDark;

  final String methodText;
  final PaymentMethodScreen widget;
  final Color _primaryDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Text(
            'Selected payment method',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black54),
          ),
          const SizedBox(height: 4),
          Text(
            methodText,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            'Amount to pay',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black54),
          ),
          const SizedBox(height: 4),
          Text(
            '${widget.amount.toStringAsFixed(2)} EGP',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold, color: _primaryDark),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text('OK', style: TextStyle(fontSize: 16,color: AppColors.mainColor,) )),
            ),
          
        ],
      ),
    );
  }
}