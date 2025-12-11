import 'package:json_annotation/json_annotation.dart';

part 'crypto_merket_model.g.dart';

@JsonSerializable()
class CryptoMerketModel {
  String? id;
  String? symbol;
  String? name;
  String? image;
  @JsonKey(name: 'current_price')
  double? currentPrice;
  @JsonKey(name: 'market_cap')
  int? marketCap;
  @JsonKey(name: 'market_cap_rank')
  int? marketCapRank;
  @JsonKey(name: 'fully_diluted_valuation')
  int? fullyDilutedValuation;
  @JsonKey(name: 'total_volume')
  int? totalVolume;
  @JsonKey(name: 'high_24h')
  int? high24h;
  @JsonKey(name: 'low_24h')
  int? low24h;
  @JsonKey(name: 'price_change_24h')
  double? priceChange24h;
  @JsonKey(name: 'price_change_percentage_24h')
  double? priceChangePercentage24h;
  @JsonKey(name: 'market_cap_change_24h')
  int? marketCapChange24h;
  @JsonKey(name: 'market_cap_change_percentage_24h')
  double? marketCapChangePercentage24h;
  @JsonKey(name: 'circulating_supply')
  int? circulatingSupply;
  @JsonKey(name: 'total_supply')
  int? totalSupply;
  @JsonKey(name: 'max_supply')
  int? maxSupply;
  int? ath;
  @JsonKey(name: 'ath_change_percentage')
  double? athChangePercentage;
  @JsonKey(name: 'ath_date')
  DateTime? athDate;
  double? atl;
  @JsonKey(name: 'atl_change_percentage')
  double? atlChangePercentage;
  @JsonKey(name: 'atl_date')
  DateTime? atlDate;
  dynamic roi;
  @JsonKey(name: 'last_updated')
  DateTime? lastUpdated;
  @JsonKey(name: 'price_change_percentage_24h_in_currency')
  double? priceChangePercentage24hInCurrency;

  CryptoMerketModel({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24h,
    this.low24h,
    this.priceChange24h,
    this.priceChangePercentage24h,
    this.marketCapChange24h,
    this.marketCapChangePercentage24h,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.roi,
    this.lastUpdated,
    this.priceChangePercentage24hInCurrency,
  });

  factory CryptoMerketModel.fromJson(Map<String, dynamic> json) {
    return _$CryptoMerketModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CryptoMerketModelToJson(this);
}
