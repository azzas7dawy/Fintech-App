import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
class SelectedTab extends StatelessWidget {
  const SelectedTab({super.key, required this.isDark, required this.label});

  final bool isDark;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0.h,
      padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 6.0.h),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: isDark ? AppColors.white : AppColors.mainColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyles.styles.latoW600S14.copyWith(
              color: isDark ? AppColors.darkModeTextColor : AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
