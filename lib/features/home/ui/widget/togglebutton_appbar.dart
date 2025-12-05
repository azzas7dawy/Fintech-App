import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageToggleButton extends StatelessWidget {
  const LanguageToggleButton();

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';

    return IconButton(
      onPressed: () async {
        final newLocale = isArabic ? const Locale('en') : const Locale('ar');
        await context.setLocale(newLocale);
      },
      icon: Icon(Icons.language, size: 28.sp, color: context.iconColor),
      tooltip: tr('home.change_language_tooltip'),
    );
  }
}
