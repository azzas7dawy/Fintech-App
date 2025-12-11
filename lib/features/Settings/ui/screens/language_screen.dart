import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/constant/translation_keys.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.locale;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslationKeys.language.tr(),
          style: AppTextStyles.styles.latoW600S16.copyWith(
            color: context.mainText,
          ),
        ),
        iconTheme: IconThemeData(color: context.mainText),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 20.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TranslationKeys.selectLanguage.tr(),
                style: AppTextStyles.styles.latoW600S16.copyWith(
                  color: context.mainText,
                ),
              ),
              SizedBox(height: 20.0.h),
              _LanguageOption(
                locale: const Locale('en'),
                title: TranslationKeys.english.tr(),
                flag: countryCodeToEmoji('US'),
                isSelected: currentLocale.languageCode == 'en',
                onTap: () async {
                  await context.setLocale(const Locale('en'));
                  if (context.mounted) {
                    context.pop();
                  }
                },
              ),
              SizedBox(height: 15.0.h),
              Divider(
                color: AppColors.neutral500,
                endIndent: 4.0.w,
                indent: 4.0.w,
              ),
              SizedBox(height: 15.0.h),
              _LanguageOption(
                locale: const Locale('ar'),
                title: TranslationKeys.arabic.tr(),
                flag: countryCodeToEmoji('EG'),
                isSelected: currentLocale.languageCode == 'ar',
                onTap: () async {
                  await context.setLocale(const Locale('ar'));
                  if (context.mounted) {
                    context.pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String countryCodeToEmoji(String countryCode) {
    final String code = countryCode.toUpperCase();

    final int firstLetter = code.codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = code.codeUnitAt(1) - 0x41 + 0x1F1E6;

    return '${String.fromCharCode(firstLetter)}${String.fromCharCode(secondLetter)}';
  }
}

class _LanguageOption extends StatelessWidget {
  final Locale locale;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final String flag;

  const _LanguageOption({
    required this.locale,
    required this.title,
    required this.isSelected,
    required this.onTap,
    required this.flag,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(flag, style: TextStyle(fontSize: 28.0.sp)),
          SizedBox(width: 12.0.w),
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.styles.latoW600S16.copyWith(
                color: context.mainText,
              ),
            ),
          ),
          if (isSelected)
            Icon(Icons.check_circle, color: context.mainText, size: 24.0.r)
          else
            Icon(
              Icons.radio_button_unchecked,
              color: AppColors.neutral500,
              size: 24.0.r,
            ),
        ],
      ),
    );
  }
}
