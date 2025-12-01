import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/translation_keys.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'build_welcome_title.dart';
import 'onboarding_page_content.dart';

class BuildTitle extends StatelessWidget {
  const BuildTitle({super.key, required this.pageType});
  final OnboardingPageType pageType;

  @override
  Widget build(BuildContext context) {
    if (pageType == OnboardingPageType.welcome) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: BuildWelcomeTitle(),
        ),
      );
    }

    String titleKey;
    switch (pageType) {
      case OnboardingPageType.market:
        titleKey = TranslationKeys.onboardingMarketTitle;
        break;
      case OnboardingPageType.security:
        titleKey = TranslationKeys.onboardingSecurityTitle;
        break;
      case OnboardingPageType.getStarted:
        titleKey = TranslationKeys.onboardingGetStartedTitle;
        break;
      default:
        titleKey = TranslationKeys.onboardingWelcomeTitle;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          titleKey.tr(),
          style: AppTextStyles.styles.latoW700S30.copyWith(
            color: context.mainText,
            height: 1.2,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
