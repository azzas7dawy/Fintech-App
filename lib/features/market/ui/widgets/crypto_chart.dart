import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import 'build_chart.dart';
import 'build_time_selector.dart';
import 'price_header_row.dart';

class CryptoChart extends StatelessWidget {
  const CryptoChart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Container(
      height: 315.h,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: isDark ? AppColors.containerDark : AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.textDisabled.withValues(alpha: 0.1),
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          const PriceHeaderRow(),

          SizedBox(height: 16.h),

          const Expanded(child: BuildChart()),
          SizedBox(height: 16.h),
          const BuildTimeSelector(),
        ],
      ),
    );
  }
}
