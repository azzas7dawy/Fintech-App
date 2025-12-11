import 'package:fintech_app/features/market/data/datasources/services/crypto_services/crypto_service.dart';
import 'package:fintech_app/features/market/data/models/crypto_merket_model/crypto_merket_model.dart';
import 'package:fintech_app/features/market/data/models/search_response_model.dart';

class CryptoMarketRepo {
  final CryptoMarketService cryptoMarketService;

  CryptoMarketRepo({required this.cryptoMarketService});

  Future<List<CryptoMerketModel>> getCryptoMarkets({
    required String vsCurrency,
    String? category,
    required String order,
    required int perPage,
    required int page,
    required bool sparkline,
    required String priceChangePercentage,
  }) {
    return cryptoMarketService.getCryptoMarkets(
      vsCurrency: vsCurrency,
      order: order,
      perPage: perPage,
      page: page,
      sparkline: sparkline,
      priceChangePercentage: priceChangePercentage,
      category: category,
    );
  }

  /// 🟢 Search: نرجّع List<CryptoMerketModel> عشان تمشي مع الـ UI
  Future<List<CryptoMerketModel>> searchCryptoMarkets({
    required String query,
  }) async {
    final SearchResponse response =
        await cryptoMarketService.searchCoins(query);

    // response.coins -> List<SearchCoin>
    // نعملها map لـ CryptoMerketModel بسيط
    return response.coins.map((coin) {
      return CryptoMerketModel(
        id: coin.id,
        name: coin.name,
        symbol: coin.symbol,
        image: coin.large,
        // باقي الفيلدز ممكن نخليها null أو قيم افتراضية
        currentPrice: null,
        marketCap: null,
        marketCapRank: null,
        priceChangePercentage24h: null,
      );
    }).toList();
  }
}
