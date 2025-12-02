import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chart_section.dart';
import 'legend_section.dart';

class PortfolioPieChart extends StatelessWidget {
  const PortfolioPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        children: [
          // 1. Chart Section
          const ChartSection(),
          SizedBox(width: 25.w),

          const LegendSection(),
        ],
      ),
    );
  }
}
