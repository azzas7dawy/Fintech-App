
import 'package:bloc/bloc.dart';
import 'package:fintech_app/features/market/data/datasources/services/crypto_services/crypto_service.dart';
import 'package:fintech_app/features/market/data/repository/crypto_merket_repo.dart';
import 'package:fintech_app/features/market/ui/cubits/coins_cubit/crypto_market_state.dart';

class CryptoMarketCubit extends Cubit<CryptoMarketState> {
  final CryptoMarketRepo _repo;

  final int _perPage = 20;
  bool _isLoadingMore = false;
  bool _isSearching = false;

  String? _currentCategoryId;

  CryptoMarketCubit({required CryptoMarketService cryptoMarketService})
      : _repo = CryptoMarketRepo(cryptoMarketService: cryptoMarketService),
        super(CryptoMarketInitial());

  Future<void> getCryptoMarketData({String? categoryId}) async {
    _isSearching = false;
    emit(CryptoMarketLoading());
    try {
      _currentCategoryId = categoryId;

      final cryptoMarkets = await _repo.getCryptoMarkets(
        vsCurrency: "usd",
        order: "market_cap_desc",
        perPage: _perPage,
        page: 1,
        sparkline: false,
        priceChangePercentage: "24h",
        category: _currentCategoryId,
      );

      final hasMore = cryptoMarkets.length == _perPage;

      emit(
        CryptoMarketSuccess(
          cryptoMarkets: cryptoMarkets,
          hasMore: hasMore,
          currentPage: 1,
        ),
      );

      print(
          "Crypto Market Data Fetched Successfully (page 1, category: $_currentCategoryId)");
    } catch (e) {
      emit(CryptoMarketError(message: e.toString()));
    }
  }

  /// Search – لما المستخدم يكتب في السيرش
  Future<void> searchCrypto(String query) async {
    // لو المستخدم مسح السيرش → نرجع للداتا الأساسية للكاتيجوري الحالية
    if (query.trim().isEmpty) {
      _isSearching = false;
      if (_currentCategoryId == null && state is! CryptoMarketInitial) {
        // لو All ومفيش state ملعوب فيه → رجّع نفس الداتا
        await getCryptoMarketData(categoryId: _currentCategoryId);
      } else {
        await getCryptoMarketData(categoryId: _currentCategoryId);
      }
      return;
    }

    try {
      _isSearching = true;
      emit(CryptoMarketLoading());


      final results = await _repo.searchCryptoMarkets(query: query);

      emit(
        CryptoMarketSuccess(
          cryptoMarkets: results,
          hasMore: false,
          currentPage: 1,
        ),
      );

      print("Search results for '$query' fetched successfully");
    } catch (e) {
      emit(CryptoMarketError(message: e.toString()));
    }
  }

 
  Future<void> loadMoreCryptoMarkets() async {
  
    if (_isSearching) return;

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
        category: _currentCategoryId,
      );

      final hasMore = newMarkets.length == _perPage;

      emit(
        currentState.copyWith(
          cryptoMarkets: [...currentState.cryptoMarkets, ...newMarkets],
          hasMore: hasMore,
          currentPage: nextPage,
        ),
      );

      print(
          "Loaded more markets page $nextPage (category: $_currentCategoryId)");
    } catch (e) {
      print(e);
      emit(CryptoMarketError(message: e.toString()));
    } finally {
      _isLoadingMore = false;
    }
  }
}
