import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/translation_keys.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'divider_statics.dart';
import 'statics_item.dart';

class StaticsDetails extends StatelessWidget {
  final double currentPrice;
  final double marketCap;
  final int marketCapRank;
  final double priceChangePercentage24h;
  final double totalSupply;
  final double maxSupply;
  const StaticsDetails( {super.key, required this.currentPrice, required this.marketCap, required this.marketCapRank, required this.priceChangePercentage24h, required this.totalSupply, required this.maxSupply});
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TranslationKeys.statics.tr(),
          style: AppTextStyles.styles.latoW600S18.copyWith(
            color: context.primaryText,
          ),
        ),
        StaticsItem(
          title: currentPrice.toString(),
          value: '44.826,12 \$',
        ),
        const DividerStatics(),
        StaticsItem(title: marketCap.toString(), value: '836,819 \$'),
        const DividerStatics(),
        StaticsItem(title: marketCapRank.toString(), value: '35,867 \$'),
        const DividerStatics(),
        StaticsItem(
          title: priceChangePercentage24h.toString(),
          value: '18,784',
        ),
        const DividerStatics(),
        StaticsItem(title: maxSupply.toString(), value: '21,000'),
      ],
    );
  }
}
