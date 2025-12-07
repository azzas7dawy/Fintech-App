import 'package:fintech_app/features/market/data/datasources/services/crypto_services/crypto_service.dart';
import 'package:fintech_app/features/market/data/models/crypto_merket_model/crypto_merket_model.dart';

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
}
