import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import 'legend_item.dart';

class LegendSection extends StatelessWidget {
  const LegendSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LegendItem(
            color: AppColors.softVioletPieChart1,
            amount: '\$54,382.64',
            coin: 'BTC',
          ),
          SizedBox(height: 12.h),
          const LegendItem(
            color: AppColors.brightCyanPieChart2,
            amount: '\$4,145.61',
            coin: 'ETH',
          ),
          SizedBox(height: 12.h),
          const LegendItem(
            color: AppColors.salmonPinkPieChart3,
            amount: '\$64,20.5',
            coin: 'LTC',
          ),
        ],
      ),
    );
  }
}
