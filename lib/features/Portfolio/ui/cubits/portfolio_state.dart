import 'package:equatable/equatable.dart';
import 'package:fintech_app/features/Portfolio/data/models/item_my_hold_model.dart';

abstract class PortfolioState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PortfolioInitial extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioSuccess extends PortfolioState {
  final List<ItemMyHoldModel> holdings;
  final double totalValue;
  final double total24hChange;
  final double total24hChangeAmount;

  PortfolioSuccess({
    required this.holdings,
    required this.totalValue,
    required this.total24hChange,
    required this.total24hChangeAmount,
  });

  @override
  List<Object?> get props => [
    holdings,
    totalValue,
    total24hChange,
    total24hChangeAmount,
  ];
}

class PortfolioError extends PortfolioState {
  final String message;

  PortfolioError({required this.message});

  @override
  List<Object?> get props => [message];
}
