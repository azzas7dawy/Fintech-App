import 'package:equatable/equatable.dart';

import '../../../../core/constant/assets.dart';
import 'portfolio_price_model.dart';

class ItemMyHoldModel extends Equatable {
  final String coinId;
  final String coinName;
  final String coinSymbol;
  final double quantityRaw;
  final String quantity;
  final String value;
  final String allocation;
  final String gainAmount;
  final String gainPercentage;
  final String imageUrl;
  final double currentPrice;

  const ItemMyHoldModel({
    this.coinId = 'bitcoin',
    this.coinName = 'Bitcoin',
    this.coinSymbol = 'BTC',
    this.quantityRaw = 0.05,
    this.quantity = '0.05 BTC',
    this.value = '\$2,262.53',
    this.allocation = '50%',
    this.gainAmount = '+\$145.20',
    this.gainPercentage = '+6.85%',
    this.imageUrl = Assets.imagesImage,
    this.currentPrice = 0.0,
  });

  factory ItemMyHoldModel.fromApiData({
    required String coinId,
    required String coinName,
    required String coinSymbol,
    required double quantityRaw,
    required CoinPrice priceData,
    required String imageUrl,
    required double allocationPercentage,
  }) {
    final currentPrice = priceData.usd ?? 0.0;
    final totalValue = quantityRaw * currentPrice;
    final change24h = priceData.usd24hChange ?? 0.0;
    final gainAmount = totalValue * (change24h / 100);

    return ItemMyHoldModel(
      coinId: coinId,
      coinName: coinName,
      coinSymbol: coinSymbol,
      quantityRaw: quantityRaw,
      quantity: '$quantityRaw $coinSymbol',
      value: '\$${totalValue.toStringAsFixed(2)}',
      allocation: '${allocationPercentage.toStringAsFixed(0)}%',
      gainAmount:
          '${gainAmount >= 0 ? '+' : ''}\$${gainAmount.toStringAsFixed(2)}',
      gainPercentage:
          '${change24h >= 0 ? '+' : ''}${change24h.toStringAsFixed(2)}%',
      imageUrl: imageUrl,
      currentPrice: currentPrice,
    );
  }

  @override
  List<Object?> get props => [
    coinId,
    coinName,
    coinSymbol,
    quantityRaw,
    quantity,
    value,
    allocation,
    gainAmount,
    gainPercentage,
    imageUrl,
    currentPrice,
  ];

  ItemMyHoldModel copyWith({
    String? coinId,
    String? coinName,
    String? coinSymbol,
    double? quantityRaw,
    String? quantity,
    String? value,
    String? allocation,
    String? gainAmount,
    String? gainPercentage,
    String? imageUrl,
    double? currentPrice,
  }) {
    return ItemMyHoldModel(
      coinId: coinId ?? this.coinId,
      coinName: coinName ?? this.coinName,
      coinSymbol: coinSymbol ?? this.coinSymbol,
      quantityRaw: quantityRaw ?? this.quantityRaw,
      quantity: quantity ?? this.quantity,
      value: value ?? this.value,
      allocation: allocation ?? this.allocation,
      gainAmount: gainAmount ?? this.gainAmount,
      gainPercentage: gainPercentage ?? this.gainPercentage,
      imageUrl: imageUrl ?? this.imageUrl,
      currentPrice: currentPrice ?? this.currentPrice,
    );
  }
}
