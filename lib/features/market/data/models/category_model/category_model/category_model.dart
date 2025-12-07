import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  /// id اللي جاية من الـ API هنخزنها في categoryId
  @JsonKey(name: 'id')
  final String? categoryId;

  final String? name;

  @JsonKey(name: 'market_cap')
  final double? marketCap;

  @JsonKey(name: 'market_cap_change_24h')
  final double? marketCapChange24h;

  final String? content;

  @JsonKey(name: 'top_3_coins_id')
  final List<String>? top3CoinsId;

  @JsonKey(name: 'top_3_coins')
  final List<String>? top3Coins;

  @JsonKey(name: 'volume_24h')
  final double? volume24h;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const CategoryModel({
    this.categoryId,
    this.name,
    this.marketCap,
    this.marketCapChange24h,
    this.content,
    this.top3CoinsId,
    this.top3Coins,
    this.volume24h,
    this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
