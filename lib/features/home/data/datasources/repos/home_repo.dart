// lib/features/home/data/datasources/repos/home_repo.dart
import 'package:dio/dio.dart';
import 'package:fintech_app/features/home/data/home_servicea/api_client_service.dart';
import 'package:fintech_app/features/home/data/models/top_gainers_response.dart';
import 'package:fintech_app/features/home/data/models/trending_response.dart';


class HomeAggregate {
  final List<TrendingCoin> trending;
  final List<GainerItem> gainers;

  HomeAggregate({this.trending = const [], this.gainers = const []});
}

class HomeRepository {
  final ApiClient api;
  HomeRepository(this.api);

  Future<List<TrendingCoin>> getTrendingCoins() async {
    try {
      final resp = await api.getTrending();
      return resp.coins;
    } on DioError catch (e) {
      final serverMessage = _extractServerMessage(e);
      throw Exception(serverMessage ?? 'Failed to load trending: ${e.message}');
    } catch (e) {
      throw Exception('Failed to load trending: $e');
    }
  }

  /// For Pro users (keeps support if you have Pro access)
  Future<List<GainerItem>> getTopGainers({
    String vsCurrency = 'usd',
    String? duration,
    int? topCoins,
  }) async {
    try {
      final resp = await api.getTopGainers(
        vsCurrency: vsCurrency,
        duration: duration,
        topCoins: topCoins,
      );
      return resp.topGainers;
    } on DioError catch (e) {
      final serverMessage = _extractServerMessage(e);
      throw Exception(serverMessage ?? 'Failed to load gainers: ${e.message}');
    } catch (e) {
      throw Exception('Failed to load gainers: $e');
    }
  }

  /// Fallback: compute top gainers locally from coins/markets (for demo/public key)
  Future<List<GainerItem>> getTopGainersFromMarkets({
    String vsCurrency = 'usd',
    int top = 10,
  }) async {
    try {
      final markets = await api.getCoinsMarkets(
        vsCurrency: vsCurrency,
        perPage: 250,
        page: 1,
        priceChangePercentage: '24h',
      );

      final filtered = markets.where((m) => m.priceChangePercentage24h != null).toList();
      filtered.sort((a, b) => (b.priceChangePercentage24h ?? 0)
          .compareTo(a.priceChangePercentage24h ?? 0));

      final topList = filtered.take(top).toList();

      final result = topList.map((m) {
        return GainerItem(
          id: m.id,
          symbol: m.symbol,
          name: m.name,
          image: m.image,
          marketCapRank: null,
          usdPrice: m.currentPrice,
          usd24hVolume: null,
          usd24hChange: m.priceChangePercentage24h,
          usd1hChange: null,
          usd7dChange: null,
          usd14dChange: null,
        );
      }).toList();

      return result;
    } on DioError catch (e) {
      final serverMessage = _extractServerMessage(e);
      throw Exception(serverMessage ?? 'Failed to load markets: ${e.message}');
    } catch (e) {
      throw Exception('Failed to load markets: $e');
    }
  }

  /// Fetch home: always try to return trending first.
  /// Try pro top_gainers, fallback to markets; do not throw if only gainers fail.
  Future<HomeAggregate> fetchHome({String vsCurrency = 'usd'}) async {
    try {
      // 1) load trending (if this fails we bubble the error)
      final trendingResp = await api.getTrending();
      final List<TrendingCoin> trending = trendingResp.coins;

      // 2) load gainers: try pro endpoint first, fallback to markets
      List<GainerItem> gainers = [];
      try {
        final topResp = await api.getTopGainers(vsCurrency: vsCurrency);
        gainers = topResp.topGainers;
      } catch (_) {
        try {
          gainers = await getTopGainersFromMarkets(vsCurrency: vsCurrency, top: 10);
        } catch (_) {
          // fallback failed too — keep gainers empty but return trending
          gainers = [];
        }
      }

      return HomeAggregate(trending: trending, gainers: gainers);
    } on DioError catch (dioErr) {
      // trending failed => propagate meaningful error
      final msg = _extractServerMessage(dioErr) ?? dioErr.message;
      throw Exception('Network error: $msg');
    } catch (e) {
      throw Exception('Failed to load home: $e');
    }
  }

  // helper to extract server message from DioError responses
  String? _extractServerMessage(DioError e) {
    try {
      final data = e.response?.data;
      if (data == null) return null;
      if (data is Map) {
        if (data.containsKey('error_message')) return data['error_message']?.toString();
        if (data.containsKey('message')) return data['message']?.toString();
        if (data.containsKey('status')) {
          final status = data['status'];
          if (status is Map && status.containsKey('error_message')) {
            return status['error_message']?.toString();
          }
        }
      } else {
        return data.toString();
      }
    } catch (_) {}
    return null;
  }
}
