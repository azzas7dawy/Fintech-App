// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortfolioPriceResponse _$PortfolioPriceResponseFromJson(
        Map<String, dynamic> json) =>
    PortfolioPriceResponse(
      bitcoin: json['bitcoin'] == null
          ? null
          : CoinPrice.fromJson(json['bitcoin'] as Map<String, dynamic>),
      ethereum: json['ethereum'] == null
          ? null
          : CoinPrice.fromJson(json['ethereum'] as Map<String, dynamic>),
      binancecoin: json['binancecoin'] == null
          ? null
          : CoinPrice.fromJson(json['binancecoin'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PortfolioPriceResponseToJson(
        PortfolioPriceResponse instance) =>
    <String, dynamic>{
      'bitcoin': instance.bitcoin,
      'ethereum': instance.ethereum,
      'binancecoin': instance.binancecoin,
    };

CoinPrice _$CoinPriceFromJson(Map<String, dynamic> json) => CoinPrice(
      usd: (json['usd'] as num?)?.toDouble(),
      usdMarketCap: (json['usd_market_cap'] as num?)?.toDouble(),
      usd24hVol: (json['usd_24h_vol'] as num?)?.toDouble(),
      usd24hChange: (json['usd_24h_change'] as num?)?.toDouble(),
      lastUpdatedAt: (json['last_updated_at'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CoinPriceToJson(CoinPrice instance) => <String, dynamic>{
      'usd': instance.usd,
      'usd_market_cap': instance.usdMarketCap,
      'usd_24h_vol': instance.usd24hVol,
      'usd_24h_change': instance.usd24hChange,
      'last_updated_at': instance.lastUpdatedAt,
    };
