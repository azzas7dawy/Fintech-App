import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/features/market/data/datasources/crypto_services/crypto_service.dart';
import 'package:fintech_app/features/market/ui/cubit/crypto_market_cubit.dart';
import 'package:fintech_app/features/market/ui/cubit/crypto_market_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/assets.dart';
import '../../../../core/constant/translation_keys.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/card_crypto_market.dart';
import '../widgets/crypto_market_tabbar.dart';
import '../widgets/search_text_field.dart';

class CryptoMarketScreen extends StatefulWidget {
  const CryptoMarketScreen({super.key});

  @override
  State<CryptoMarketScreen> createState() => _CryptoMarketScreenState();
}

class _CryptoMarketScreenState extends State<CryptoMarketScreen> {
 
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  

 
  }
  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final threshold = 300.0; // لما يبقى فاضل 300px على آخر الليست

    if (_scrollController.position.extentAfter < threshold) {
      context.read<CryptoMarketCubit>().loadMoreCryptoMarkets();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
                BlocBuilder<CryptoMarketCubit, CryptoMarketState>(
  builder: (context, state) {
    if (state is CryptoMarketLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is CryptoMarketError) {
      return Center(child: Text(state.message));
    } else if (state is CryptoMarketSuccess) {
      final markets = state.cryptoMarkets;
      final hasMore = state.hasMore;

      return ListView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: markets.length + (hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= markets.length) {
            // آخر عنصر = loader بتاع الـ pagination
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }

          final coin = markets[index];

          return GestureDetector(
            onTap: () {
              context.push(Routes.coinDetails, extra: coin);
            },
            child: CardCryptoMarket(
              name: coin.name ?? 'Bitcoin',
              rank: 'Rank #${coin.marketCapRank ?? index + 1}',
              price:
                  '\$${(coin.currentPrice ?? 0).toStringAsFixed(2)}',
              percentage:
                  '${(coin.priceChangePercentage24h ?? 0).toStringAsFixed(2)}%',
              imageUrl: (coin.image ?? Assets.imagesBitcoin),
            ),
          );
        },
      );
    }

    return const SizedBox.shrink();
  },
),
],
               )

            ),
          ),
        ),
    );

  }
}
