import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

/// Configuration builder for chart touch interactions
class ChartTouchConfiguration {
  ChartTouchConfiguration._();

  // Constants for touch interaction styling
  static const double _touchDotRadius = 4.0;
  static const double _touchDotStrokeWidth = 2.0;
  static const double _tooltipPadding = 4.0;
  static const double _tooltipBorderRadius = 8.0;

  /// Builds and returns the touch data configuration for the chart
  static LineTouchData buildTouchData() {
    return LineTouchData(
      getTouchedSpotIndicator: _buildTouchedSpotIndicator,
      touchTooltipData: _buildTooltipData(),
    );
  }

  /// Builds the touched spot indicator (the dot that appears on touch)
  static List<TouchedSpotIndicatorData> _buildTouchedSpotIndicator(
    LineChartBarData barData,
    List<int> spotIndexes,
  ) {
    return spotIndexes.map((spotIndex) {
      return TouchedSpotIndicatorData(
        const FlLine(color: Colors.transparent), // Hide indicator line
        FlDotData(
          getDotPainter: (spot, percent, barData, index) {
            return FlDotCirclePainter(
              radius: _touchDotRadius,
              color: AppColors.tooltip,
              strokeWidth: _touchDotStrokeWidth,
              strokeColor: Colors.white,
            );
          },
        ),
      );
    }).toList();
  }

  /// Builds the tooltip configuration
  static LineTouchTooltipData _buildTooltipData() {
    return LineTouchTooltipData(
      getTooltipColor: (spot) => AppColors.tooltip,
      tooltipPadding: EdgeInsets.all(_tooltipPadding.r),
      tooltipBorderRadius: BorderRadius.circular(_tooltipBorderRadius.r),
      getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
        return touchedBarSpots.map((barSpot) {
          return LineTooltipItem(
            '\$${barSpot.y}',
            AppTextStyles.styles.latoW600S10.copyWith(color: AppColors.white),
          );
        }).toList();
      },
      fitInsideHorizontally: true,
      fitInsideVertically: true,
    );
  }
}
