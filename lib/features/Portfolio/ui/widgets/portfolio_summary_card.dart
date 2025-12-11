import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/assets.dart';
import '../../../../core/constant/translation_keys.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class PortfolioSummaryCard extends StatelessWidget {
  final double totalValue;
  final double changePercentage;
  final double changeAmount;
  final bool isLoading;

  const PortfolioSummaryCard({
    super.key,
    required this.totalValue,
    required this.changePercentage,
    required this.changeAmount,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = changeAmount >= 0;
    final changeColor = isPositive ? context.textGreen : context.errorText;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      width: double.infinity,
      height: 140.h,
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: Image.asset(Assets.imagesEllipseLeft, fit: BoxFit.cover),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(Assets.imagesEllipseRight, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 33.0.w, vertical: 12.h),
            child: Column(
              children: [
                Text(
                  TranslationKeys.totalValue.tr(),
                  style: AppTextStyles.styles.latoW600S14.copyWith(
                    height: 2.02,
                    letterSpacing: 0.44,
                    color: context.textOnDark,
                  ),
                ),
                SizedBox(height: 10.h),
                isLoading
                    ? SizedBox(
                        height: 28.h,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                            strokeWidth: 2,
                          ),
                        ),
                      )
                    : Text(
                        '\$${totalValue.toStringAsFixed(2)}',
                        style: AppTextStyles.styles.latoW700S28.copyWith(
                          height: 1.01,
                          letterSpacing: 0.44,
                          color: AppColors.white,
                        ),
                      ),
                SizedBox(height: 14.h),
                if (!isLoading)
                  Text(
                    '${isPositive ? '+' : ''}${changePercentage.toStringAsFixed(2)}% (${isPositive ? '+' : ''}\$${changeAmount.abs().toStringAsFixed(2)}) ${TranslationKeys.today.tr()}',
                    style: AppTextStyles.styles.latoW400S14.copyWith(
                      color: changeColor,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
