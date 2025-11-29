import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class BuildChart extends StatelessWidget {
  const BuildChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return const FlLine(
              color: AppColors.gridLight,
              strokeWidth: .5,
              dashArray: [10, 10],
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,

              getTitlesWidget: (value, meta) {
                // تحويل الأرقام لساعات وهمية للمثال
                switch (value.toInt()) {
                  case 0:
                    return _bottomTitle('00.00');
                  case 4:
                    return _bottomTitle('04.00');
                  case 8:
                    return _bottomTitle('08.00');
                  case 12:
                    return _bottomTitle('12.00');
                  case 16:
                    return _bottomTitle('16.00');
                  case 20:
                    return _bottomTitle('20.00');
                  case 24:
                    return _bottomTitle('23.59');
                }
                return const SizedBox();
              },
              interval: 4,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        minX: -1,
        maxX: 25,
        minY: 1.3,
        maxY: 5.5,
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(-1, 3),
              FlSpot(2, 4),
              FlSpot(5, 3.2),
              FlSpot(8, 4.5),
              FlSpot(10, 3.8),
              FlSpot(13, 3.8),
              FlSpot(15, 2.5),
              FlSpot(17, 4.5),
              FlSpot(19, 3.5),
              FlSpot(21, 5.5), // القمة العالية
              FlSpot(22.5, 4),
              FlSpot(24, 4.8),
            ],
            isCurved: true, // عشان الخط يبقى Smooth Curve
            color: context.isDarkMode ? AppColors.white : AppColors.primaryDark,
            barWidth: 1.5,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.surfaceDark.withValues(alpha: 0.8),
                  AppColors.surfaceDark.withValues(alpha: 0.1),
                ],
              ),
            ),
          ),
        ],

        lineTouchData: LineTouchData(
          getTouchedSpotIndicator:
              (LineChartBarData barData, List<int> spotIndexes) {
                return spotIndexes.map((spotIndex) {
                  return TouchedSpotIndicatorData(
                    const FlLine(color: Colors.transparent), // إخفاء خط المؤشر
                    FlDotData(
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 4,
                          color: AppColors.tooltip,
                          strokeWidth: 2,
                          strokeColor: Colors.white,
                        );
                      },
                    ),
                  );
                }).toList();
              },
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (spot) => AppColors.tooltip,
            tooltipPadding: EdgeInsets.all(4.r),
            tooltipBorderRadius: BorderRadius.circular(8.r),
            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
              return touchedBarSpots.map((barSpot) {
                return LineTooltipItem(
                  '\$${barSpot.y}',
                  AppTextStyles.styles.latoW600S10.copyWith(
                    color: AppColors.white,
                  ),
                );
              }).toList();
            },
            fitInsideHorizontally: true,
            fitInsideVertically: true,
          ),
        ),
      ),
    );
  }

  Widget _bottomTitle(String text) {
    return Text(
      text,
      style: AppTextStyles.styles.latoW400S12.copyWith(
        color: AppColors.textDisabled,
      ),
    );
  }
}
