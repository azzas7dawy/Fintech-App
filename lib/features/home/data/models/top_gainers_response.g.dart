// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_gainers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopGainersResponse _$TopGainersResponseFromJson(Map<String, dynamic> json) =>
    TopGainersResponse(
      topGainers: (json['top_gainers'] as List<dynamic>?)
              ?.map((e) => GainerItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TopGainersResponseToJson(TopGainersResponse instance) =>
    <String, dynamic>{
      'top_gainers': instance.topGainers,
    };

GainerItem _$GainerItemFromJson(Map<String, dynamic> json) => GainerItem(
      id: json['id'] as String?,
      symbol: json['symbol'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      marketCapRank: (json['market_cap_rank'] as num?)?.toInt(),
      usdPrice: (json['usd'] as num?)?.toDouble(),
      usd24hVolume: (json['usd_24h_vol'] as num?)?.toDouble(),
      usd24hChange: (json['usd_24h_change'] as num?)?.toDouble(),
      usd1hChange: (json['usd_1h_change'] as num?)?.toDouble(),
      usd7dChange: (json['usd_7d_change'] as num?)?.toDouble(),
      usd14dChange: (json['usd_14d_change'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GainerItemToJson(GainerItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'market_cap_rank': instance.marketCapRank,
      'usd': instance.usdPrice,
      'usd_24h_vol': instance.usd24hVolume,
      'usd_24h_change': instance.usd24hChange,
      'usd_1h_change': instance.usd1hChange,
      'usd_7d_change': instance.usd7dChange,
      'usd_14d_change': instance.usd14dChange,
    };
