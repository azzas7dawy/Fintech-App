// lib/features/home/data/models/top_gainers_response.dart
import 'package:json_annotation/json_annotation.dart';

part 'top_gainers_response.g.dart';

@JsonSerializable()
class TopGainersResponse {
  @JsonKey(name: 'top_gainers')
  final List<GainerItem> topGainers;

  TopGainersResponse({this.topGainers = const []});

  factory TopGainersResponse.fromJson(Map<String, dynamic> json) => _$TopGainersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TopGainersResponseToJson(this);
}

@JsonSerializable()
class GainerItem {
  final String? id;
  final String? symbol;
  final String? name;
  final String? image;
  @JsonKey(name: 'market_cap_rank')
  final int? marketCapRank;
  @JsonKey(name: 'usd')
  final double? usdPrice;
  @JsonKey(name: 'usd_24h_vol')
  final double? usd24hVolume;
  @JsonKey(name: 'usd_24h_change')
  final double? usd24hChange;
  @JsonKey(name: 'usd_1h_change')
  final double? usd1hChange;
  @JsonKey(name: 'usd_7d_change')
  final double? usd7dChange;
  @JsonKey(name: 'usd_14d_change')
  final double? usd14dChange;

  GainerItem({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.marketCapRank,
    this.usdPrice,
    this.usd24hVolume,
    this.usd24hChange,
    this.usd1hChange,
    this.usd7dChange,
    this.usd14dChange,
  });

  factory GainerItem.fromJson(Map<String, dynamic> json) => _$GainerItemFromJson(json);
  Map<String, dynamic> toJson() => _$GainerItemToJson(this);
}
