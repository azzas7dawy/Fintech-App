// part of 'crypto_market_cubit.dart';

import 'package:fintech_app/features/market/data/models/crypto_merket_model/crypto_merket_model.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class CryptoMarketState {}

class CryptoMarketInitial extends CryptoMarketState {}

class CryptoMarketLoading extends CryptoMarketState {}

class CryptoMarketSuccess extends CryptoMarketState {
  final List<CryptoMerketModel> cryptoMarkets;
  final bool hasMore;
  final int currentPage;

  CryptoMarketSuccess({
    required this.cryptoMarkets,
    required this.hasMore,
    required this.currentPage,
  });

  CryptoMarketSuccess copyWith({
    List<CryptoMerketModel>? cryptoMarkets,
    bool? hasMore,
    int? currentPage,
  }) {
    return CryptoMarketSuccess(
      cryptoMarkets: cryptoMarkets ?? this.cryptoMarkets,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

class CryptoMarketError extends CryptoMarketState {
  final String message;
  CryptoMarketError({required this.message});
}
