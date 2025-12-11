import 'package:dio/dio.dart';
import 'package:fintech_app/features/Portfolio/data/models/portfolio_price_model.dart';
import 'package:retrofit/retrofit.dart';

part 'portfolio_service.g.dart';

@RestApi(baseUrl: 'https://api.coingecko.com/api/v3/')
abstract class PortfolioService {
  factory PortfolioService(Dio dio) = _PortfolioService;

  @GET('simple/price')
  Future<PortfolioPriceResponse> getPortfolioPrices({
    @Query('vs_currencies') required String vsCurrencies,
    @Query('ids') required String ids,
    @Query('include_market_cap') required bool includeMarketCap,
    @Query('include_24hr_vol') required bool include24hrVol,
    @Query('include_24hr_change') required bool include24hrChange,
    @Query('include_last_updated_at') required bool includeLastUpdatedAt,
  });
}
