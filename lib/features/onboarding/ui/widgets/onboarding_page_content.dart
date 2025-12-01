import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/translation_keys.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

enum OnboardingPageType { welcome, market, security, getStarted }

class OnboardingPageContent extends StatelessWidget {
  final OnboardingPageType pageType;
  final Widget illustration;

  const OnboardingPageContent({
    super.key,
    required this.pageType,
    required this.illustration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Center(child: illustration)),
        SizedBox(height: 40.h),
        _buildTitle(context),
        SizedBox(height: 16.h),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    if (pageType == OnboardingPageType.welcome) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Align(
          alignment: Alignment.centerLeft,
          child: _buildWelcomeTitle(context),
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
            color: context.primaryText,
            height: 1.2,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget _buildWelcomeTitle(BuildContext context) {
    final isDark = context.isDarkMode;
    final part1 = TranslationKeys.onboardingWelcomeTitlePart1.tr();
    final part2 = TranslationKeys.onboardingWelcomeTitlePart2.tr();

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: part1,
            style: AppTextStyles.styles.latoW700S30.copyWith(
              color: isDark ? Colors.white : const Color(0xFF18191F),
            ),
          ),
          TextSpan(
            text: part2,
            style: AppTextStyles.styles.latoW700S30.copyWith(
              color: AppColors.primaryDark,
            ),
          ),
        ],
      ),
    );
  }
}
