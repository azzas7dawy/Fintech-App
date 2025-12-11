import 'package:fintech_app/features/Portfolio/data/datasources/services/portfolio_service.dart';
import 'package:fintech_app/features/Portfolio/data/models/portfolio_price_model.dart';

class PortfolioRepo {
  final PortfolioService portfolioService;

  PortfolioRepo({required this.portfolioService});

  Future<PortfolioPriceResponse> getPortfolioPrices() {
    return portfolioService.getPortfolioPrices(
      vsCurrencies: 'usd',
      ids: 'bitcoin,ethereum,binancecoin',
      includeMarketCap: true,
      include24hrVol: true,
      include24hrChange: true,
      includeLastUpdatedAt: true,
    );
  }
}
