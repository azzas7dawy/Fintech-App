import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentBuyButton extends StatelessWidget {
  final Color primaryDark;
  final VoidCallback onPressed;

  const PaymentBuyButton({
    super.key,
    required this.primaryDark,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.r),
          ),
        ),
        child:  Text(
          'Buy',
          style: AppTextStyles.styles.latoW600S16.copyWith(
            color: AppColors.darkLightGroundColor,
          ),
        ),
      ),
    );
  }
}
