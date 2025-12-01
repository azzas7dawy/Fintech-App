import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'build_title.dart';

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
        BuildTitle(pageType: pageType),
        SizedBox(height: 16.h),
      ],
    );
  }
}
