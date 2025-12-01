import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';

class PortfolioSelectedTabBar extends StatelessWidget {
  const PortfolioSelectedTabBar({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: ShapeDecoration(
        color: context.portfolioBackgroundSelectedTabBar,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10.w,
        children: [
          Text(
            label,
            style: AppTextStyles.styles.latoW500S12.copyWith(
              color: context.portfolioSelectedTextTabBar,
            ),
          ),
        ],
      ),
    );
  }
}
