import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/features/market/data/models/crypto_merket_model/crypto_merket_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/translation_keys.dart';
import '../../../../core/theme/app_text_styles.dart';

import '../widgets/about_coin_details.dart';
import '../widgets/crypto_chart.dart';
import '../widgets/row_name_details.dart';
import '../widgets/statics_details.dart';
import '../widgets/trade_buttons.dart';

class CoinDetailsScreen extends StatelessWidget {
  final CryptoMerketModel coin;
  const CoinDetailsScreen( {super.key,required this.coin});

  @override
  Widget build(BuildContext context) {
    //  final  coinsDetails=ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: AppTextStyles.styles.latoW700S24.copyWith(
          color: context.mainText,
        ),
        title: Text(
      TranslationKeys.coinDetails.tr(),
          style: AppTextStyles.styles.latoW700S24.copyWith(
            color: context.mainText,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back, color: context.mainText),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
               RowNameDetails(name:coin.name??'bitcoin',symbol: coin.symbol??'',image:coin.image??''),// RowNameDetails(name: coin.name,symbol: coin.symbol,image:coin.image),
              SizedBox(height: 40.h),
              const CryptoChart(),
              SizedBox(height: 20.h),
StaticsDetails(
  currentPrice: coin.currentPrice ?? 0, // double
  marketCap: (coin.marketCap ?? 0).toDouble(),
  marketCapRank: coin.marketCapRank ?? 0,
  priceChangePercentage24h: coin.priceChangePercentage24h ?? 0,
  totalSupply: (coin.totalSupply ?? 0).toDouble(),
  maxSupply: (coin.maxSupply ?? 0).toDouble(),
),
    
              SizedBox(height: 20.h),
               AboutCoinDetails(coinName: coin.name ?? 'Bitcoin', 
              coinDescription:'${coin.name} is a decentralized cryptocurrency originally described in a 2008 whitepaper by a person, or group of people, using the alias Satoshi Nakamoto. It was launched soon after, in January 2009.',),
              SizedBox(height: 25.h),
              const TradeButtons(),
              SizedBox(height: 25.h),
            ],
          ),
        ),
      ),
    );
  }
}
