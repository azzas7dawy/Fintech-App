
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CryptoCurrencyPill extends StatelessWidget {
  final String currencyCode;

  const CryptoCurrencyPill({
    required this.currencyCode,
  });

  @override
  Widget build(BuildContext context) {
    final firstLetter = currencyCode.isNotEmpty ? currencyCode[0] : '?';

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.darkLightContainerColor,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Row(
        children: [
          // small crypto icon placeholder (replace with asset if available)
          Container(
            width: 26.w,
            height: 26.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.darkModeBackGroundColor,
            ),
            child: Center(
              child: Text(
                firstLetter,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            currencyCode,
            style: const TextStyle(color: AppColors.mainColor),
          ),
          SizedBox(width: 4.w),
           Icon(
            Icons.keyboard_arrow_down,
            size: 18.sp,
            color: AppColors.mainColor,
          ),
        ],
      ),
    );
  }
}

class _RateRow extends StatelessWidget {
  const _RateRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         SizedBox(width: 50.w),
         Icon(
          Icons.circle,
          size: 8.sp,
          color: AppColors.orangColor,
        ),
        const SizedBox(width: 8),
        Text(
          '1 USD = 0.00078 ETH',
          style: AppTextStyles.styles.latoW500S14.copyWith(
            color: AppColors.gray500,
          ),
        ),
      ],
    );
  }
}