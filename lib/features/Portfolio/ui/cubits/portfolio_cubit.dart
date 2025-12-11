import 'package:bloc/bloc.dart';
import 'package:fintech_app/core/constant/assets.dart';
import 'package:fintech_app/features/Portfolio/data/datasources/services/portfolio_service.dart';
import 'package:fintech_app/features/Portfolio/data/models/item_my_hold_model.dart';
import 'package:fintech_app/features/Portfolio/data/repository/portfolio_repo.dart';
import 'package:fintech_app/features/Portfolio/ui/cubits/portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  final PortfolioRepo _repo;

  // Hardcoded holdings configuration
  final Map<String, Map<String, dynamic>> _holdingsConfig = {
    'bitcoin': {
      'name': 'Bitcoin',
      'symbol': 'BTC',
      'quantity': 0.05,
      'image': Assets.imagesBitcoin,
    },
    'ethereum': {
      'name': 'Ethereum',
      'symbol': 'ETH',
      'quantity': 2.0,
      'image': Assets.imagesEthereum,
    },
    'binancecoin': {
      'name': 'Binance Coin',
      'symbol': 'BNB',
      'quantity': 5.0,
      'image': Assets.imagesBinanceCoin,
    },
  };

  PortfolioCubit({required PortfolioService portfolioService})
    : _repo = PortfolioRepo(portfolioService: portfolioService),
      super(PortfolioInitial());

  Future<void> getPortfolioData() async {
    emit(PortfolioLoading());
    try {
      final priceResponse = await _repo.getPortfolioPrices();

      final List<ItemMyHoldModel> holdings = [];
      double totalValue = 0.0;
      double totalPreviousValue = 0.0;

      // Process each coin
      if (priceResponse.bitcoin != null) {
        final config = _holdingsConfig['bitcoin']!;
        final coinValue =
            config['quantity'] * (priceResponse.bitcoin!.usd ?? 0.0);
        totalValue += coinValue;

        final change24h = priceResponse.bitcoin!.usd24hChange ?? 0.0;
        final previousValue = coinValue / (1 + (change24h / 100));
        totalPreviousValue += previousValue;
      }

      if (priceResponse.ethereum != null) {
        final config = _holdingsConfig['ethereum']!;
        final coinValue =
            config['quantity'] * (priceResponse.ethereum!.usd ?? 0.0);
        totalValue += coinValue;

        final change24h = priceResponse.ethereum!.usd24hChange ?? 0.0;
        final previousValue = coinValue / (1 + (change24h / 100));
        totalPreviousValue += previousValue;
      }

      if (priceResponse.binancecoin != null) {
        final config = _holdingsConfig['binancecoin']!;
        final coinValue =
            config['quantity'] * (priceResponse.binancecoin!.usd ?? 0.0);
        totalValue += coinValue;

        final change24h = priceResponse.binancecoin!.usd24hChange ?? 0.0;
        final previousValue = coinValue / (1 + (change24h / 100));
        totalPreviousValue += previousValue;
      }

      // Calculate allocations and create holdings list
      if (priceResponse.bitcoin != null) {
        final config = _holdingsConfig['bitcoin']!;
        final coinValue =
            config['quantity'] * (priceResponse.bitcoin!.usd ?? 0.0);
        final allocation = totalValue > 0
            ? (coinValue / totalValue) * 100
            : 0.0;

        holdings.add(
          ItemMyHoldModel.fromApiData(
            coinId: 'bitcoin',
            coinName: config['name'],
            coinSymbol: config['symbol'],
            quantityRaw: config['quantity'],
            priceData: priceResponse.bitcoin!,
            imageUrl: config['image'],
            allocationPercentage: allocation,
          ),
        );
      }

      if (priceResponse.ethereum != null) {
        final config = _holdingsConfig['ethereum']!;
        final coinValue =
            config['quantity'] * (priceResponse.ethereum!.usd ?? 0.0);
        final allocation = totalValue > 0
            ? (coinValue / totalValue) * 100
            : 0.0;

        holdings.add(
          ItemMyHoldModel.fromApiData(
            coinId: 'ethereum',
            coinName: config['name'],
            coinSymbol: config['symbol'],
            quantityRaw: config['quantity'],
            priceData: priceResponse.ethereum!,
            imageUrl: config['image'],
            allocationPercentage: allocation,
          ),
        );
      }

      if (priceResponse.binancecoin != null) {
        final config = _holdingsConfig['binancecoin']!;
        final coinValue =
            config['quantity'] * (priceResponse.binancecoin!.usd ?? 0.0);
        final allocation = totalValue > 0
            ? (coinValue / totalValue) * 100
            : 0.0;

        holdings.add(
          ItemMyHoldModel.fromApiData(
            coinId: 'binancecoin',
            coinName: config['name'],
            coinSymbol: config['symbol'],
            quantityRaw: config['quantity'],
            priceData: priceResponse.binancecoin!,
            imageUrl: config['image'],
            allocationPercentage: allocation,
          ),
        );
      }

      // Calculate total 24h change
      final total24hChangeAmount = totalValue - totalPreviousValue;
      final total24hChange = totalPreviousValue > 0
          ? (total24hChangeAmount / totalPreviousValue) * 100
          : 0.0;

      emit(
        PortfolioSuccess(
          holdings: holdings,
          totalValue: totalValue,
          total24hChange: total24hChange,
          total24hChangeAmount: total24hChangeAmount,
        ),
      );

      print('Portfolio Data Fetched Successfully');
    } catch (e) {
      emit(PortfolioError(message: e.toString()));
      print('Error fetching portfolio data: $e');
    }
  }
}
