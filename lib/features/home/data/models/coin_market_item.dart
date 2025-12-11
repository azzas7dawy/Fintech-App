// lib/features/home/data/models/coin_market_item.dart
import 'package:json_annotation/json_annotation.dart';

part 'coin_market_item.g.dart';

@JsonSerializable()
class CoinMarketItem {
  final String id;
  final String symbol;
  final String name;
  final String? image;

  @JsonKey(name: 'current_price')
  final double? currentPrice;

  @JsonKey(name: 'market_cap')
  final double? marketCap;

  @JsonKey(name: 'price_change_percentage_24h')
  final double? priceChangePercentage24h;

  CoinMarketItem({
    required this.id,
    required this.symbol,
    required this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.priceChangePercentage24h,
  });

  factory CoinMarketItem.fromJson(Map<String, dynamic> json) => _$CoinMarketItemFromJson(json);
  Map<String, dynamic> toJson() => _$CoinMarketItemToJson(this);
}
