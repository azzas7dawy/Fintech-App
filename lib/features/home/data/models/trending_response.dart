// lib/models/trending_response.dart
import 'package:json_annotation/json_annotation.dart';
import 'coin_item.dart';

part 'trending_response.g.dart';

@JsonSerializable()
class TrendingResponse {
  final List<TrendingCoin> coins;

  TrendingResponse({this.coins = const []});

  factory TrendingResponse.fromJson(Map<String, dynamic> json) => _$TrendingResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TrendingResponseToJson(this);
}

@JsonSerializable()
class TrendingCoin {
  final CoinItem? item;

  TrendingCoin({this.item});

  factory TrendingCoin.fromJson(Map<String, dynamic> json) => _$TrendingCoinFromJson(json);
  Map<String, dynamic> toJson() => _$TrendingCoinToJson(this);
}
