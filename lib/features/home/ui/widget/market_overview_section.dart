import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'market_overview_card.dart';

class MarketOverviewSection extends StatelessWidget {
  const MarketOverviewSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr('home.market_overview.title'),
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: context.mainText,
          ),
        ),
        SizedBox(height: 16.h),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 12.h,
          crossAxisSpacing: 12.w,
          childAspectRatio: 1.25,
          children: [
            MarketOverviewCard(
              title: tr('home.market_overview.market_cap'),
              value: '\$2.1T',
              percentage: '+2.35%',
              isPositive: true,
            ),
            MarketOverviewCard(
              title: tr('home.market_overview.volume_24h'),
              value: '\$85.5B',
              percentage: '+1.25%',
              isPositive: true,
            ),
            MarketOverviewCard(
              title: tr('home.market_overview.btc_dominance'),
              value: '48.5%',
              percentage: '-0.15%',
              isPositive: false,
            ),
            MarketOverviewCard(
              title: tr('home.market_overview.active_coins'),
              value: '19,417',
              percentage: '+0.85%',
              isPositive: true,
            ),
          ],
        ),
      ],
    );
  }
}
