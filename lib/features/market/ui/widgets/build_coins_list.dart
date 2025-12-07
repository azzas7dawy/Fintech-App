import 'package:fintech_app/features/market/ui/cubits/coins_cubit/crypto_market_cubit.dart';
import 'package:fintech_app/features/market/ui/cubits/coins_cubit/crypto_market_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/assets.dart';
import '../../../../core/routing/routes.dart';
import '../widgets/card_crypto_market.dart';

class CryptoMarketCoinsList extends StatelessWidget {
  final ScrollController scrollController;

  const CryptoMarketCoinsList({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoMarketCubit, CryptoMarketState>(
      builder: (context, state) {
        if (state is CryptoMarketLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CryptoMarketError) {
          return Center(child: Text(state.message));
        }

        if (state is CryptoMarketSuccess) {
          final markets = state.cryptoMarkets;
          final hasMore = state.hasMore;

          if (markets.isEmpty) {
            return const Center(
              child: Text("No coins in this category"),
            );
          }

          return ListView.builder(
            controller: scrollController,
            itemCount: markets.length + (hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= markets.length) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              final coin = markets[index];

              return GestureDetector(
                onTap: () {
                  context.push(
                    Routes.coinDetails,
                    extra: coin,
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: CardCryptoMarket(
                    name: coin.name ?? 'Bitcoin',
                    rank: 'Rank #${coin.marketCapRank ?? index + 1}',
                    price: '\$${(coin.currentPrice ?? 0).toStringAsFixed(2)}',
                    percentage:
                        '${(coin.priceChangePercentage24h ?? 0).toStringAsFixed(2)}%',
                    imageUrl: (coin.image ?? Assets.imagesBitcoin),
                  ),
                ),
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
