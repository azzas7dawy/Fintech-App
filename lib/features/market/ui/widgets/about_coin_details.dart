import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/translation_keys.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class AboutCoinDetails extends StatelessWidget {
  const AboutCoinDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TranslationKeys.aboutCoin.tr(namedArgs: {'name': 'Bitcoin'}),
          style: AppTextStyles.styles.latoW600S18.copyWith(
            color: context.isDarkMode ? AppColors.white : AppColors.darkBlue,
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          'Bitcoin is a decentralized cryptocurrency originally described in a 2008 whitepaper by a person, or group of people, using the alias Satoshi Nakamoto. It was launched soon after, in January 2009.',
          style: AppTextStyles.styles.latoW400S16.copyWith(
            color: isDark ? AppColors.white : AppColors.gray,
            height: 1.50,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
