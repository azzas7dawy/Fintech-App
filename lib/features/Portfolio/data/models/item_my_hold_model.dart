
import 'package:equatable/equatable.dart';

import '../../../../core/constant/assets.dart';

class ItemMyHoldModel extends Equatable {
  final String coinName;
  final String coinSymbol;
  final String quantity;
  final String value;
  final String allocation;
  final String gainAmount;
  final String gainPercentage;
  final String imageUrl;

  const ItemMyHoldModel({
    this.coinName = 'Bitcoin',
    this.coinSymbol = 'BTC',
    this.quantity = '0.05 BTC',
    this.value = '\$2,262.53',
    this.allocation = '50%',
    this.gainAmount = '+\$145.20',
    this.gainPercentage = '+6.85%',
    this.imageUrl = Assets.imagesImage,
  });

  @override
  List<Object?> get props => [
    coinName,
    coinSymbol,
    quantity,
    value,
    allocation,
    gainAmount,
    gainPercentage,
    imageUrl,
  ];

  ItemMyHoldModel copyWith({
    String? coinName,
    String? coinSymbol,
    String? quantity,
    String? value,
    String? allocation,
    String? gainAmount,
    String? gainPercentage,
    String? imageUrl,
  }) {
    return ItemMyHoldModel(
      coinName: coinName ?? this.coinName,
      coinSymbol: coinSymbol ?? this.coinSymbol,
      quantity: quantity ?? this.quantity,
      value: value ?? this.value,
      allocation: allocation ?? this.allocation,
      gainAmount: gainAmount ?? this.gainAmount,
      gainPercentage: gainPercentage ?? this.gainPercentage,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
