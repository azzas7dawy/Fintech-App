// lib/models/coin_item.dart
import 'package:json_annotation/json_annotation.dart';

part 'coin_item.g.dart';

@JsonSerializable()
class CoinItem {
  final String? id;
  @JsonKey(name: 'coin_id')
  final int? coinId;
  final String? name;
  final String? symbol;
  final int? market_cap_rank;
  final String? thumb;
  final String? small;
  final String? large;
  final String? slug;
  final double? price_btc;
  final double? score;

  CoinItem({
    this.id,
    this.coinId,
    this.name,
    this.symbol,
    this.market_cap_rank,
    this.thumb,
    this.small,
    this.large,
    this.slug,
    this.price_btc,
    this.score,
  });

  factory CoinItem.fromJson(Map<String, dynamic> json) => _$CoinItemFromJson(json);
  Map<String, dynamic> toJson() => _$CoinItemToJson(this);
}
