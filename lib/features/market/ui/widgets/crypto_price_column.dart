import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class CryptoPriceColumn extends StatelessWidget {
  const CryptoPriceColumn({
    super.key,
    required this.price,
    required this.percentage,
  });

  final String price;
  final String percentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          price,
          style: AppTextStyles.styles.latoW700S20.copyWith(
            color: context.successText,
          ),
        ),
        SizedBox(height: 4.0.h),
        Container(
          padding: EdgeInsets.all(4.0.r),
          decoration: ShapeDecoration(
            // con
            color: percentage.startsWith('-')
                ? AppColors.errorPrimary.withValues(alpha: 0.8)
                : AppColors.successPrimaryLight.withValues(alpha: 0.8),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          child: Row(
            children: [
              Icon(
                percentage.startsWith('-')
                    ? Icons.call_received_outlined
                    : Icons.call_made_outlined,
                size: 14.0.sp,
                color: AppColors.white,
              ),
              Text(
                percentage,
                style: AppTextStyles.styles.latoW400S16.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
