part of 'crypto_market_cubit.dart';

@immutable
sealed class CryptoMarketState {}

final class CryptoMarketInitial extends CryptoMarketState {}
final class CryptoMarketLoading extends CryptoMarketState {}
final class CryptoMarketSuccess extends CryptoMarketState {
  final List<CryptoMerketModel> cryptoMarkets;
  CryptoMarketSuccess({required this.cryptoMarkets});
}
final class CryptoMarketError extends CryptoMarketState {
  final String message;   
  CryptoMarketError({required this.message});
}
