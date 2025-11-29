import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
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
  const CoinDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: AppTextStyles.styles.latoW700S24.copyWith(
          color: context.mainText,
        ),
        title: Text(TranslationKeys.coinDetails.tr()),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: context.mainText,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              const RowNameDetails(),
              SizedBox(height: 40.h),
              const CryptoChart(),
              SizedBox(height: 20.h),
              const StaticsDetails(),
              SizedBox(height: 20.h),
              const AboutCoinDetails(),
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
