import 'package:fl_chart/fl_chart.dart';

import '../../../../../core/theme/app_colors.dart';

/// Configuration builder for chart grid styling
class ChartGridConfiguration {
  ChartGridConfiguration._();

  /// Builds and returns the grid data configuration for the chart
  static FlGridData buildGridData() {
    return FlGridData(
      show: true,
      drawVerticalLine: false,
      horizontalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return const FlLine(
          color: AppColors.gridLight,
          strokeWidth: 0.5,
          dashArray: [10, 10],
        );
      },
    );
  }
}
