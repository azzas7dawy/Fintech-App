import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';

class UnSelectedTab extends StatelessWidget {
  const UnSelectedTab({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.0.h,
      width: 110.w,
      padding: EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 6.0.h),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: context.cardBackground,
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(color: context.divider.withOpacity(0.12), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
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
            color: context.primaryText,
          ),
        ),
      ),
    );
  }
}
