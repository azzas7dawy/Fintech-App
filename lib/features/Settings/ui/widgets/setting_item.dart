import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.iconName,
    required this.title,
    required this.onTap,
  });
  final String iconName;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            radius: 15.0.r,
            backgroundColor: context.isDarkMode
                ? AppColors.primaryDark
                : AppColors.infoSecondary,
            child: SvgPicture.asset(iconName),
          ),
          SizedBox(width: 15.0.w),
          Text(
            title,
            style: AppTextStyles.styles.latoW600S16.copyWith(
              color: context.mainText,
            ),
          ),
          const Spacer(),
          Icon(Icons.arrow_forward_ios, color: context.mainText),
        ],
      ),
    );
  }
}
