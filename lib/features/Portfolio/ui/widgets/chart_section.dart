import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ChartSection extends StatelessWidget {
  const ChartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 137.h,
      width: 137.h,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              startDegreeOffset: 150,
              sectionsSpace: 0,
              centerSpaceRadius: 60.r,
              sections: [
                // BTC
                PieChartSectionData(
                  color: AppColors.brightCyanPieChart2,
                  value: 33.3,
                  radius: 15.r,
                  showTitle: false,
                ),
                // ETH
                PieChartSectionData(
                  color: AppColors.softVioletPieChart1,
                  value: 33.3,
                  radius: 15.r,

                  showTitle: false,
                ),
                // LTC
                PieChartSectionData(
                  color: AppColors.salmonPinkPieChart3,
                  value: 33.3,
                  radius: 15.r,
                  showTitle: false,
                ),
              ],
            ),
          ),
          // Total Balance Text (Centered)
          Center(
            child: Text(
              ' \$143,421.20',
              style: AppTextStyles.styles.latoW700S15.copyWith(
                color: context.mainText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
