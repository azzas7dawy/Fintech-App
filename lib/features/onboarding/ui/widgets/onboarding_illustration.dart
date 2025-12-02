import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/assets.dart';
import 'onboarding_page_content.dart';

class OnboardingIllustration extends StatelessWidget {
  final OnboardingPageType pageType;

  const OnboardingIllustration({super.key, required this.pageType});

  @override
  Widget build(BuildContext context) {
    switch (pageType) {
      case OnboardingPageType.welcome:
        return const BuildWelcomeIllustration(image: Assets.imagesOnBoarding1);
      case OnboardingPageType.security:
        return const BuildWelcomeIllustration(image: Assets.imagesOnBoarding2);
      case OnboardingPageType.market:
        return const BuildWelcomeIllustration(image: Assets.imagesOnBoarding3);

      case OnboardingPageType.getStarted:
        return const BuildWelcomeIllustration(image: Assets.imagesGetStarted);
    }
  }
}

class BuildWelcomeIllustration extends StatelessWidget {
  const BuildWelcomeIllustration({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      height: 300.w,
      child: Image.asset(image, fit: BoxFit.contain),
    );
  }
}
