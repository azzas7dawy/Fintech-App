import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/icon_for_toggle_mode.dart';
import 'package:fintech_app/features/home/ui/widget/togglebutton_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24.r,
          backgroundColor:
          context.isDarkMode ? AppColors.surfaceVariant : Colors.blue.shade100,
          child: Icon(
            Icons.person,
            size: 28.sp,
            color: context.primaryText,
          ),
        ),
        SizedBox(width: 12.w),

        Text(
          tr('home.greeting', args: ['Ahmed']),
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: context.primaryText,
          ),
        ),

        const Spacer(),

        Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: context.cardBackground,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: context.cardShadow,
          ),
          child: Image.asset(
            'assets/icons/notification.png',
            width: 24.w,
            height: 24.h,
            color: context.iconColor,
          ),
        ),

        SizedBox(width: 8.w),
        const IconForToggleMode(),
        SizedBox(width: 8.w),
        const LanguageToggleButton(),
      ],
    );
  }
}
