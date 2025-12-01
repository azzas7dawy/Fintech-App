import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/translation_keys.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class BuildWelcomeTitle extends StatelessWidget {
  const BuildWelcomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final part1 = TranslationKeys.onboardingWelcomeTitlePart1.tr();
    final part2 = TranslationKeys.onboardingWelcomeTitlePart2.tr();
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: part1,
            style: AppTextStyles.styles.latoW700S30.copyWith(
              color: context.primaryText,
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
