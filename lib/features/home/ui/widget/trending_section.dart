import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/features/home/ui/widget/trending_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/assets.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tr('home.trending.title'),
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: context.mainText,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                tr('home.trending.view_all'),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF2B5BF5),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 150.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              TrendingCard(
                name: 'Bitcoin',
                symbol: 'BTC',
                price: '1,132,151',
                percentage: '+2.35%',
                isPositive: true,
                image: Assets.imagesBitcoin,
              ),
              TrendingCard(
                name: 'Ethereum',
                symbol: 'ETH',
                price: '20,788',
                percentage: '+1.85%',
                isPositive: true,
                image: Assets.imagesEthereum,

              ),
            ],
          ),
        ),
      ],
    );
  }
}