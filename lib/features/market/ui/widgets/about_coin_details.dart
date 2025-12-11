import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/translation_keys.dart';
import '../../../../core/theme/app_text_styles.dart';

class AboutCoinDetails extends StatelessWidget {
  final String coinName;
   final String coinDescription;
  const AboutCoinDetails({super.key, required this.coinName, required this.coinDescription});
   
  
  @override
  Widget build(BuildContext context) {
      // final  coinsDetails=ModalRoute.of(context)!.settings.arguments as List;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TranslationKeys.aboutCoin.tr(namedArgs: {'name':coinName}),
          style: AppTextStyles.styles.latoW600S18.copyWith(
            color: context.primaryText,
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          coinDescription,
          style: AppTextStyles.styles.latoW400S16.copyWith(
            color: context.secondaryText,
            height: 1.50,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
