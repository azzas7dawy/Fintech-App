import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/chart_config_model.dart';
import 'chart_builders/grid_configuration.dart';
import 'chart_builders/touch_configuration.dart';

class BuildChart extends StatelessWidget {
  final ChartConfigModel? config;

  const BuildChart({super.key, this.config});

  @override
  Widget build(BuildContext context) {
    final chartConfig = config ?? ChartConfigModel.mock();

    return LineChart(
      LineChartData(
        gridData: ChartGridConfiguration.buildGridData(),
        titlesData: _buildTitlesData(chartConfig),
        borderData: FlBorderData(show: false),
        minX: chartConfig.minX,
        maxX: chartConfig.maxX,
        minY: chartConfig.minY,
        maxY: chartConfig.maxY,
        lineBarsData: [_buildLineBarData(chartConfig, context)],
        lineTouchData: ChartTouchConfiguration.buildTouchData(),
      ),
    );
  }

  /// Builds the titles configuration for the chart axes
  FlTitlesData _buildTitlesData(ChartConfigModel config) {
    return FlTitlesData(
      show: true,
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      bottomTitles: _buildBottomTitles(config),
    );
  }

  /// Builds the bottom axis titles with time labels
  AxisTitles _buildBottomTitles(ChartConfigModel config) {
    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          return _getTimeLabel(value);
        },
        interval: config.bottomInterval,
      ),
    );
  }

  /// Returns the appropriate time label widget for the given value
  Widget _getTimeLabel(double value) {
    final timeLabel = switch (value.toInt()) {
      0 => '00.00',
      4 => '04.00',
      8 => '08.00',
      12 => '12.00',
      16 => '16.00',
      20 => '20.00',
      24 => '23.59',
      _ => null,
    };

    if (timeLabel == null) {
      return const SizedBox();
    }

    return _buildTimeLabel(timeLabel);
  }

  /// Builds a time label text widget with consistent styling
  Widget _buildTimeLabel(String text) {
    return Text(
      text,
      style: AppTextStyles.styles.latoW400S12.copyWith(
        color: AppColors.textDisabled,
      ),
    );
  }

  /// Builds the line bar data with gradient and styling
  LineChartBarData _buildLineBarData(
    ChartConfigModel config,
    BuildContext context,
  ) {
    return LineChartBarData(
      spots: config.dataPoints,
      isCurved: true,
      color: context.mainText,
      barWidth: 1.5,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(show: true, gradient: _buildGradient()),
    );
  }

  /// Builds the gradient for the area below the chart line
  LinearGradient _buildGradient() {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.surfaceDark.withValues(alpha: 0.8),
        AppColors.surfaceDark.withValues(alpha: 0.1),
      ],
    );
  }
}
