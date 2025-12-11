// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinItem _$CoinItemFromJson(Map<String, dynamic> json) => CoinItem(
      id: json['id'] as String?,
      coinId: (json['coin_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      market_cap_rank: (json['market_cap_rank'] as num?)?.toInt(),
      thumb: json['thumb'] as String?,
      small: json['small'] as String?,
      large: json['large'] as String?,
      slug: json['slug'] as String?,
      price_btc: (json['price_btc'] as num?)?.toDouble(),
      score: (json['score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoinItemToJson(CoinItem instance) => <String, dynamic>{
      'id': instance.id,
      'coin_id': instance.coinId,
      'name': instance.name,
      'symbol': instance.symbol,
      'market_cap_rank': instance.market_cap_rank,
      'thumb': instance.thumb,
      'small': instance.small,
      'large': instance.large,
      'slug': instance.slug,
      'price_btc': instance.price_btc,
      'score': instance.score,
    };
