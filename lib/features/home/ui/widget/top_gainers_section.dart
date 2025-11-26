import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/features/home/ui/widget/top_gainer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopGainersSection extends StatelessWidget {
  const TopGainersSection({Key? key}) : super(key: key);

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
          image: 'assets/images/Ethereum (ETH).png',
        ),
        SizedBox(height: 12.h),
        const TopGainerCard(
          name: 'Binance Coin',
          symbol: 'BNB',
          price: '\$312.45',
          percentage: '+1.15%',
          image: 'assets/images/Binance Coin (BNB).png',
        ),
        SizedBox(height: 12.h),
        const TopGainerCard(
          name: 'Litecoin',
          symbol: 'LTC',
          price: '\$94.32',
          percentage: '+0.85%',
          image: 'assets/images/Group 48095472.png',
        ),
      ],
    );
  }
}