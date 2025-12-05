import 'package:dio/dio.dart';
import 'package:fintech_app/features/market/data/models/crypto_merket_model/crypto_merket_model.dart';
import 'package:retrofit/retrofit.dart';

part 'crypto_service.g.dart';

@RestApi(baseUrl: 'https://api.coingecko.com/api/v3/')
abstract class CryptoMarketService {
  factory CryptoMarketService(Dio dio)= _CryptoMarketService;

  @GET('coins/markets')
  Future<List<CryptoMerketModel>> getCryptoMarkets({
    @Query('vs_currency') required String vsCurrency,
    @Query('order') required String order,
    @Query('per_page') required int perPage,
    @Query('page') required int page,
    @Query('sparkline') required bool sparkline,
    @Query('price_change_percentage') required String priceChangePercentage,
  });
}
