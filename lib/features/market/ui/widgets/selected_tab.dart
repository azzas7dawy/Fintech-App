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
      height: 39.0.h,
      width:100.w ,
      padding: EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 6.0.h),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: context.mainText,
        borderRadius: BorderRadius.circular(100.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          label.tr(),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.styles.latoW600S14.copyWith(
            color: context.cardBackground,
          ),
        ),
      ),
    );
  }
}
