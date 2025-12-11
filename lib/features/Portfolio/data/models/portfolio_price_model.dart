import 'package:json_annotation/json_annotation.dart';

part 'portfolio_price_model.g.dart';

@JsonSerializable()
class PortfolioPriceResponse {
  final CoinPrice? bitcoin;
  final CoinPrice? ethereum;
  final CoinPrice? binancecoin;

  PortfolioPriceResponse({this.bitcoin, this.ethereum, this.binancecoin});

  factory PortfolioPriceResponse.fromJson(Map<String, dynamic> json) =>
      _$PortfolioPriceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioPriceResponseToJson(this);
}

@JsonSerializable()
class CoinPrice {
  @JsonKey(name: 'usd')
  final double? usd;

  @JsonKey(name: 'usd_market_cap')
  final double? usdMarketCap;

  @JsonKey(name: 'usd_24h_vol')
  final double? usd24hVol;

  @JsonKey(name: 'usd_24h_change')
  final double? usd24hChange;

  @JsonKey(name: 'last_updated_at')
  final int? lastUpdatedAt;

  CoinPrice({
    this.usd,
    this.usdMarketCap,
    this.usd24hVol,
    this.usd24hChange,
    this.lastUpdatedAt,
  });

  factory CoinPrice.fromJson(Map<String, dynamic> json) =>
      _$CoinPriceFromJson(json);

  Map<String, dynamic> toJson() => _$CoinPriceToJson(this);
}
