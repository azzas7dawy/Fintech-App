import 'package:bloc/bloc.dart';
import 'package:fintech_app/features/market/data/datasources/crypto_services/crypto_service.dart';
import 'package:fintech_app/features/market/data/models/crypto_merket_model/crypto_merket_model.dart';
import 'package:fintech_app/features/market/data/repository/crypto_merket_repo.dart';
import 'package:meta/meta.dart';

part 'crypto_market_state.dart';

class CryptoMarketCubit extends Cubit<CryptoMarketState> {
  CryptoMarketCubit() : super(CryptoMarketInitial());


  Future<void> getCryptoMarketData({required CryptoMarketService cryptoMarketService}) async {
    emit(CryptoMarketLoading());
    try {
      final cryptoMarkets = await CryptoMarketRepo(cryptoMarketService: cryptoMarketService).getCryptoMarkets(
        vsCurrency: "usd",
        order: "id_asc",
        perPage: 20,
        page: 20,
        sparkline: false, 
        priceChangePercentage: "24h",
      );
      emit(CryptoMarketSuccess(cryptoMarkets: cryptoMarkets));
    
      
      print( "Crypto Market Data: ${state}");
      print("Crypto Market Data Fetched Successfully ");
    } catch (e) {
      emit(CryptoMarketError(message: e.toString()));
    }
  }
}
