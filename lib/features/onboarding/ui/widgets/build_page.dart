import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'build_title.dart';
import 'onboarding_illustration.dart';
import 'onboarding_page_content.dart';

class BuildPage extends StatelessWidget {
  const BuildPage({
    super.key,
    required this.pageType,
    required this.showButtons,
  });
  final OnboardingPageType pageType;
  final bool showButtons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: showButtons
          ? Column(
              children: [
                Expanded(
                  child: Center(
                    child: OnboardingIllustration(pageType: pageType),
                  ),
                ),
                SizedBox(height: 40.h),
                BuildTitle(pageType: pageType),
                SizedBox(height: 40.h),
              ],
            )
          : OnboardingPageContent(
              pageType: pageType,
              illustration: OnboardingIllustration(pageType: pageType),
            ),
    );
  }
}
