// lib/features/home/data/home_servicea/api_client_service.dart
import 'package:dio/dio.dart';
import 'package:fintech_app/features/home/data/models/coin_market_item.dart';
import 'package:retrofit/retrofit.dart';
import 'package:fintech_app/features/home/data/models/trending_response.dart';
import 'package:fintech_app/features/home/data/models/top_gainers_response.dart';


part 'api_client_service.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @GET('/search/trending')
  Future<TrendingResponse> getTrending();

  @GET('/coins/top_gainers_losers')
  Future<TopGainersResponse> getTopGainers({
    @Query('vs_currency') required String vsCurrency,
    @Query('duration') String? duration,
    @Query('top_coins') int? topCoins,
  });

  @GET('/coins/markets')
  Future<List<CoinMarketItem>> getCoinsMarkets({
    @Query('vs_currency') required String vsCurrency,
    @Query('order') String? order = 'market_cap_desc',
    @Query('per_page') int? perPage = 250,
    @Query('page') int? page = 1,
    @Query('price_change_percentage') String? priceChangePercentage = '24h',
  });
}

Dio createDio({String? demoKey, String? proKey}) {
  final bool usePro = (proKey != null && proKey.isNotEmpty);
  final baseUrl = usePro
      ? 'https://pro-api.coingecko.com/api/v3'
      : 'https://api.coingecko.com/api/v3';

  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  if (usePro) {
    dio.options.headers['x-cg-pro-api-key'] = proKey!;
  } else if (demoKey != null && demoKey.isNotEmpty) {
    dio.options.headers['x-cg-demo-api-key'] = demoKey;
  }

  // useful for debugging
  dio.interceptors.add(LogInterceptor(
    request: true,
    requestHeader: true,
    requestBody: true,
    responseHeader: true,
    responseBody: true,
    error: true,
    // compact: true,
  ));

  return dio;
}
