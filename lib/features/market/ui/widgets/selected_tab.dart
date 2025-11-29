import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';

class SelectedTab extends StatelessWidget {
  const SelectedTab({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0.h,
      padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 6.0.h),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: context.mainText,
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
              color: context.cardBackground,
            ),
          ),
        ],
      ),
    );
  }
}
