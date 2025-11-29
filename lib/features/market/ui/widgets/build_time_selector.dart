import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class BuildTimeSelector extends StatelessWidget {
  const BuildTimeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> times = ['1h', '1d', '1w', '1m', '1y'];
    const String selected = '1d';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: times.map((time) {
        final bool isSelected = time == selected;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: isSelected
              ? BoxDecoration(
                  color: context.mainText,
                  borderRadius: BorderRadius.circular(8.r),
                )
              : null,
          child: Text(
            time,
            style: AppTextStyles.styles.latoW600S12.copyWith(
              color: isSelected
                  ? context.cardBackground
                  : AppColors.textDisabled,
            ),
          ),
        );
      }).toList(),
    );
  }
}
