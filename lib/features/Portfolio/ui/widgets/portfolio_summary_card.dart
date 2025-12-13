import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/assets.dart';
import '../../../../core/constant/translation_keys.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class PortfolioSummaryCard extends StatelessWidget {
  const PortfolioSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
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
                Text(
                  ' \$143,421.20',
                  style: AppTextStyles.styles.latoW700S28.copyWith(
                    height: 1.01,
                    letterSpacing: 0.44,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 14.h),
                Expanded(
                  child: Text(
                    '+2.5% (\$305.20) ${TranslationKeys.today.tr()}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppTextStyles.styles.latoW400S14.copyWith(
                      color: context.textGreen,
                    ),
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
