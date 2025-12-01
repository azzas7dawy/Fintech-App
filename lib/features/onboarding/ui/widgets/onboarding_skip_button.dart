import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/translation_keys.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../core/theme/app_text_styles.dart';

class OnboardingSkipButton extends StatelessWidget {
  final VoidCallback onPressed;

  const OnboardingSkipButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      ),
      child: Text(
        TranslationKeys.onboardingSkip.tr(),
        style: AppTextStyles.styles.latoW400S20.copyWith(
          color: context.mainText,
        ),
      ),
    );
  }
}
