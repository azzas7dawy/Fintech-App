
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/features/payment/presentation/pages/payment_method_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              width: 40.w,
              height: 4.h,
              margin: EdgeInsets.only(bottom: 16.h),
              decoration: BoxDecoration(
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
          Text(
            'Selected payment method',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black54),
          ),
           SizedBox(height: 4.h),
          Text(
            methodText,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
           SizedBox(height: 16.h),
          Text(
            'Amount to pay',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black54),
          ),
           SizedBox(height: 4.h),
          Text(
            '${widget.amount.toStringAsFixed(2)} EGP',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold, color: _primaryDark),
          ),
           SizedBox(height: 24.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child:  Text('OK', style: TextStyle(fontSize: 16.sp,color: AppColors.mainColor,) )),
            ),
          
        ],
      ),
    );
  }
}