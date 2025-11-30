import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/assets.dart';
import '../../../../core/constant/translation_keys.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/card_crypto_market.dart';
import '../widgets/crypto_market_tabbar.dart';

import '../widgets/search_text_field.dart';

class CryptoMarketScreen extends StatelessWidget {
  const CryptoMarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 20.0.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TranslationKeys.cryptoMarket.tr(),
                  style: AppTextStyles.styles.latoW700S24.copyWith(
                    color: context.mainText,
                  ),
                ),
                SizedBox(height: 16.0.h),
                const SearchTextField(),
                SizedBox(height: 16.0.h),
                const DefaultTabController(
                  length: 5,
                  child: CryptoMarketTabBar(),
                ),
                SizedBox(height: 23.0.h),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.push(Routes.coinDetails);
                      },
                      child: CardCryptoMarket(
                        name: 'Bitcoin',
                        rank: 'Rank #$index',
                        price:
                            '\$${((index + 1) * 1534.23).toStringAsFixed(2)}',
                        percentage: index.isEven ? '-12.2%' : '12.2%',
                        imageUrl: Assets.imagesBitcoin,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
