// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_market_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinMarketItem _$CoinMarketItemFromJson(Map<String, dynamic> json) =>
    CoinMarketItem(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      image: json['image'] as String?,
      currentPrice: (json['current_price'] as num?)?.toDouble(),
      marketCap: (json['market_cap'] as num?)?.toDouble(),
      priceChangePercentage24h:
          (json['price_change_percentage_24h'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoinMarketItemToJson(CoinMarketItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'current_price': instance.currentPrice,
      'market_cap': instance.marketCap,
      'price_change_percentage_24h': instance.priceChangePercentage24h,
    };
