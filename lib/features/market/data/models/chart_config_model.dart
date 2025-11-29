import 'package:fl_chart/fl_chart.dart';

/// Model class for chart configuration and data points
class ChartConfigModel {
  final List<FlSpot> dataPoints;
  final double minX;
  final double maxX;
  final double minY;
  final double maxY;
  final double horizontalInterval;
  final double bottomInterval;

  const ChartConfigModel({
    required this.dataPoints,
    required this.minX,
    required this.maxX,
    required this.minY,
    required this.maxY,
    this.horizontalInterval = 1.0,
    this.bottomInterval = 4.0,
  });

  /// Factory constructor for creating chart config from dynamic data
  factory ChartConfigModel.fromData({
    required List<FlSpot> spots,
    double? minX,
    double? maxX,
    double? minY,
    double? maxY,
    double? horizontalInterval,
    double? bottomInterval,
  }) {
    // Calculate min/max if not provided
    final xValues = spots.map((spot) => spot.x).toList();
    final yValues = spots.map((spot) => spot.y).toList();

    return ChartConfigModel(
      dataPoints: spots,
      minX: minX ?? xValues.reduce((a, b) => a < b ? a : b) - 1,
      maxX: maxX ?? xValues.reduce((a, b) => a > b ? a : b) + 1,
      minY: minY ?? yValues.reduce((a, b) => a < b ? a : b) - 0.5,
      maxY: maxY ?? yValues.reduce((a, b) => a > b ? a : b) + 0.5,
      horizontalInterval: horizontalInterval ?? 1.0,
      bottomInterval: bottomInterval ?? 4.0,
    );
  }

  /// Default mock data for testing/display purposes
  factory ChartConfigModel.mock() {
    return const ChartConfigModel(
      dataPoints: [
        FlSpot(-1, 3),
        FlSpot(2, 4),
        FlSpot(5, 3.2),
        FlSpot(8, 4.5),
        FlSpot(10, 3.8),
        FlSpot(13, 3.8),
        FlSpot(15, 2.5),
        FlSpot(17, 4.5),
        FlSpot(19, 3.5),
        FlSpot(21, 5.5),
        FlSpot(22.5, 4),
        FlSpot(24, 4.8),
      ],
      minX: -1,
      maxX: 25,
      minY: 1.3,
      maxY: 5.5,
      horizontalInterval: 1.0,
      bottomInterval: 4.0,
    );
  }
}
