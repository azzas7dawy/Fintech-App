import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/translation_keys.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'divider_statics.dart';
import 'statics_item.dart';

class StaticsDetails extends StatelessWidget {
  const StaticsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TranslationKeys.statics.tr(),
          style: AppTextStyles.styles.latoW600S18.copyWith(
            color: isDark ? AppColors.white : AppColors.surfaceDark,
          ),
        ),
        StaticsItem(
          title: TranslationKeys.currentPrice.tr(),
          value: '44.826,12 \$',
        ),
        const DividerStatics(),
        StaticsItem(title: TranslationKeys.marketCap.tr(), value: '836,819 \$'),
        const DividerStatics(),
        StaticsItem(title: TranslationKeys.volume24h.tr(), value: '35,867 \$'),
        const DividerStatics(),
        StaticsItem(
          title: TranslationKeys.availableSupply.tr(),
          value: '18,784',
        ),
        const DividerStatics(),
        StaticsItem(title: TranslationKeys.maxSupply.tr(), value: '21,000'),
      ],
    );
  }
}
