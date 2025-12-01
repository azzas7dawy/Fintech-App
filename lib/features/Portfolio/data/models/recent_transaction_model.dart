import 'package:equatable/equatable.dart';

class RecentTransactionModel extends Equatable {
  final String transactionType;
  final String cryptocurrencyName;
  final String timestamp;
  final String cryptoAmount;
  final String fiatAmount;

  const RecentTransactionModel({
    this.transactionType = 'Buy',
    this.cryptocurrencyName = 'Bitcoin',
    this.timestamp = '2 hours ago',
    this.cryptoAmount = '0.01 BTC',
    this.fiatAmount = '-\$452.50',
  });

  @override
  List<Object?> get props => [
    transactionType,
    cryptocurrencyName,
    timestamp,
    cryptoAmount,
    fiatAmount,
  ];

  RecentTransactionModel copyWith({
    String? transactionType,
    String? cryptocurrencyName,
    String? timestamp,
    String? cryptoAmount,
    String? fiatAmount,
  }) {
    return RecentTransactionModel(
      transactionType: transactionType ?? this.transactionType,
      cryptocurrencyName: cryptocurrencyName ?? this.cryptocurrencyName,
      timestamp: timestamp ?? this.timestamp,
      cryptoAmount: cryptoAmount ?? this.cryptoAmount,
      fiatAmount: fiatAmount ?? this.fiatAmount,
    );
  }
}
