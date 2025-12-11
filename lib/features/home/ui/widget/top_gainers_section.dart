import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/features/home/ui/widget/top_gainer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/assets.dart';

class TopGainersSection extends StatelessWidget {
  const TopGainersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr('home.top_gainers.title'),
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: context.mainText,
          ),
        ),

        SizedBox(height: 16.h),
        const TopGainerCard(
          name: 'Ethereum',
          symbol: 'ETH',
          price: '\$20,788',
          percentage: '+0.25%',
          image: Assets.imagesEthereum,
        ),
        SizedBox(height: 12.h),
        const TopGainerCard(
          name: 'Binance Coin',
          symbol: 'BNB',
          price: '\$312.45',
          percentage: '+1.15%',
          image: Assets.imagesBinanceCoin,
        ),
        SizedBox(height: 12.h),
        const TopGainerCard(
          name: 'Litecoin',
          symbol: 'LTC',
          price: '\$94.32',
          percentage: '+0.85%',
          image: Assets.imagesGroup48095472,
        ),
      ],
    );
  }
}
