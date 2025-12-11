// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      categoryId: json['id'] as String?,
      name: json['name'] as String?,
      marketCap: (json['market_cap'] as num?)?.toDouble(),
      marketCapChange24h: (json['market_cap_change_24h'] as num?)?.toDouble(),
      content: json['content'] as String?,
      top3CoinsId: (json['top_3_coins_id'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      top3Coins: (json['top_3_coins'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      volume24h: (json['volume_24h'] as num?)?.toDouble(),
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.categoryId,
      'name': instance.name,
      'market_cap': instance.marketCap,
      'market_cap_change_24h': instance.marketCapChange24h,
      'content': instance.content,
      'top_3_coins_id': instance.top3CoinsId,
      'top_3_coins': instance.top3Coins,
      'volume_24h': instance.volume24h,
      'updated_at': instance.updatedAt,
    };
