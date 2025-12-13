// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingResponse _$TrendingResponseFromJson(Map<String, dynamic> json) =>
    TrendingResponse(
      coins: (json['coins'] as List<dynamic>?)
              ?.map((e) => TrendingCoin.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TrendingResponseToJson(TrendingResponse instance) =>
    <String, dynamic>{
      'coins': instance.coins,
    };

TrendingCoin _$TrendingCoinFromJson(Map<String, dynamic> json) => TrendingCoin(
      item: json['item'] == null
          ? null
          : CoinItem.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrendingCoinToJson(TrendingCoin instance) =>
    <String, dynamic>{
      'item': instance.item,
    };
