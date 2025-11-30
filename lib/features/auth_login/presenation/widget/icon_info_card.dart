import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconInfoCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final double size;
  final EdgeInsets padding;

  const IconInfoCard({
    super.key,
    required this.icon,
    required this.title,
    this.size = 120,
    this.padding = const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(24),
        // boxShadow: [
        //   BoxShadow(
        //     blurRadius: 16,
        //     offset: const Offset(0, 8),
        //     color: Colors.black.withOpacity(0.10),
        //   ),
        // ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(height: 12),
          Text(
            title,
            style:AppTextStyles. styles.latoW600S16.copyWith(
              color: AppColors.textPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}