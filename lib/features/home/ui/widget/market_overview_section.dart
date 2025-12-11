import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/features/market/ui/cubits/coins_cubit/crypto_market_cubit.dart';
import 'package:fintech_app/features/market/ui/cubits/coins_cubit/crypto_market_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'market_overview_card.dart';

class MarketOverviewSection extends StatefulWidget {
  const MarketOverviewSection({Key? key}) : super(key: key);

  @override
  State<MarketOverviewSection> createState() => _MarketOverviewSectionState();
}

class _MarketOverviewSectionState extends State<MarketOverviewSection> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CryptoMarketCubit>().getCryptoMarketData();
    });
  }

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
        BlocBuilder<CryptoMarketCubit, CryptoMarketState>(
          builder: (context, state) {
            if (state is CryptoMarketLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CryptoMarketSuccess) {
              if (state.cryptoMarkets.isEmpty) {
                return Center(child: Text('No market data available'));
              }
              final market = state.cryptoMarkets[0];
              return SizedBox(
                height: 340.h,
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.h,
                  crossAxisSpacing: 12.w,
                  childAspectRatio: 1.25,
                  children: [
                    // Market Cap
                    MarketOverviewCard(
                      title: tr('home.market_overview.market_cap'),
                      value: formatCompact(market.marketCap, decimals: 1),
                     
                      percentage: formatPercentage(market.priceChangePercentage24h),
                      isPositive: (market.priceChangePercentage24h ?? 0) >= 0,
                    ),

                    // 24h Volume
                    MarketOverviewCard(
                      title: tr('home.market_overview.volume_24h'),
                      value: formatCompact(market.totalVolume, decimals: 1),
                      percentage: formatPercentage(market.priceChangePercentage24h),
                      isPositive: (market.priceChangePercentage24h ?? 0) >= 0,
                    ),

                    MarketOverviewCard(
                      title: tr('home.market_overview.btc_dominance'),
                      value: formatPercentage(market.priceChangePercentage24h, decimals: 2),
                      percentage: '',
                      isPositive: (market.priceChangePercentage24h ?? 0) >= 0,
                    ),
                    MarketOverviewCard(
                      title: tr('home.market_overview.active_coins'),
                      value: formatWithSeparator(market.athChangePercentage).replaceAll('-', ''),
                      percentage: '',
                      isPositive: true,
                    ),
                  ],
                ),
              );
            } else if (state is CryptoMarketError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text('Waiting for data...'));
            }
          },
        ),
      ],
    );
  }
}
String formatCompact(num? value, {int decimals = 1}) {
  if (value == null) return '-';
  final v = value.toDouble().abs();
  final sign = value < 0 ? '-' : '';
  
  String formatted;
  
  if (v >= 1e12) {
    formatted = '${(v / 1e12).toStringAsFixed(decimals)}T';
  } else if (v >= 1e9) {
    formatted = '${(v / 1e9).toStringAsFixed(decimals)}B';
  } else if (v >= 1e6) {
    formatted = '${(v / 1e6).toStringAsFixed(decimals)}M';
  } else if (v >= 1e3) {
    formatted = '${(v / 1e3).toStringAsFixed(decimals)}K';
  } else {
    formatted = v.toStringAsFixed(decimals);
  }

  return '$sign\$$formatted'; //  ← لاحظ $ قبل الرقم
}


/// Thousand separator formatting: 19,417 or 1,234,567
String formatWithSeparator(num? value) {
  if (value == null) return '-';
  final formatter = NumberFormat.decimalPattern('en_US');
  return formatter.format(value);
}

/// Percentage formatting with + / - and fixed decimals (e.g. +2.35%)
String formatPercentage(num? value, {int decimals = 2}) {
  if (value == null) return '-';
  final v = value.toDouble();
  final sign = v > 0 ? '+' : '';
  return '$sign${v.toStringAsFixed(decimals)}%';
}
