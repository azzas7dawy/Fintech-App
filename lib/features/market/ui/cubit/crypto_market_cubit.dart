import 'package:bloc/bloc.dart';
import 'package:fintech_app/features/market/data/datasources/crypto_services/crypto_service.dart';

import 'package:fintech_app/features/market/data/repository/crypto_merket_repo.dart';
import 'package:fintech_app/features/market/ui/cubit/crypto_market_state.dart';




class CryptoMarketCubit extends Cubit<CryptoMarketState> {
  final CryptoMarketRepo _repo;

  final int _perPage = 20;
  bool _isLoadingMore = false;

  CryptoMarketCubit({required CryptoMarketService cryptoMarketService})
      : _repo = CryptoMarketRepo(cryptoMarketService: cryptoMarketService),
        super(CryptoMarketInitial());
  Future<void> getCryptoMarketData() async {
    emit(CryptoMarketLoading());
    try {
      final cryptoMarkets = await _repo.getCryptoMarkets(
        vsCurrency: "usd",
        order: "market_cap_desc",
        perPage: _perPage,
        page: 1,
        sparkline: false,
        priceChangePercentage: "24h",
      );

      final hasMore = cryptoMarkets.length == _perPage;

      emit(
        CryptoMarketSuccess(
          cryptoMarkets: cryptoMarkets,
          hasMore: hasMore,
          currentPage: 1,
        ),
      );

      print("Crypto Market Data Fetched Successfully (page 1)");
    } catch (e) {
      emit(CryptoMarketError(message: e.toString()));
    }
  }

  /// تحميل صفحة جديدة (pagination)
  Future<void> loadMoreCryptoMarkets() async {
    final currentState = state;

    if (currentState is! CryptoMarketSuccess) return;
    if (_isLoadingMore || !currentState.hasMore) return;

    _isLoadingMore = true;

    try {
      final nextPage = currentState.currentPage + 1;

      final newMarkets = await _repo.getCryptoMarkets(
        vsCurrency: "usd",
        order: "market_cap_desc",
        perPage: _perPage,
        page: nextPage,
        sparkline: false,
        priceChangePercentage: "24h",
      );

      final hasMore = newMarkets.length == _perPage;

      emit(
        currentState.copyWith(
          cryptoMarkets: [
            ...currentState.cryptoMarkets,
            ...newMarkets,
          ],
          hasMore: hasMore,
          currentPage: nextPage,
        ),
      );

      print("Loaded more markets page $nextPage");
    } catch (e) {
      print(e);
      emit(CryptoMarketError(message: e.toString()));
    } finally {
      _isLoadingMore = false;
    }
  }
}


