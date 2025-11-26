import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/icon_for_toggle_mode.dart';
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
          backgroundColor: context.isDarkMode
              ? AppColors.darkModeContainerColor
              : Colors.blue.shade100,
          child: Icon(
            Icons.person,
            size: 28.sp,
            color: context.isDarkMode ? Colors.white : AppColors.mainColor,
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
            color: context.isDarkMode ? AppColors.gray800 : Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: context.isDarkMode
                ? []
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: Image.asset(
            'assets/icons/notification.png',
            width: 24.w,
            height: 24.h,
          ),
        ),
        SizedBox(width: 8.w),
        const IconForToggleMode(),
        SizedBox(width: 8.w),
        const _LanguageToggleButton(),
      ],
    );
  }
}

class _LanguageToggleButton extends StatelessWidget {
  const _LanguageToggleButton();

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    return IconButton(
      onPressed: () async {
        final newLocale = isArabic ? const Locale('en') : const Locale('ar');
        await context.setLocale(newLocale);
      },
      icon: Icon(
        Icons.language,
        size: 28.sp,
        color: context.isDarkMode ? Colors.white : AppColors.mainColor,
      ),
      tooltip: tr('home.change_language_tooltip'),
    );
  }
}