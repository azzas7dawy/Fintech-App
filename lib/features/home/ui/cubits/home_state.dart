// lib/features/home/ui/cubits/home_state.dart
part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<TrendingCoin> trending;
  final List<GainerItem> gainers;

  const HomeLoaded({this.trending = const [], this.gainers = const []});

  @override
  List<Object?> get props => [trending, gainers];
}

class HomeError extends HomeState {
  final String message;
  const HomeError({required this.message});

  @override
  List<Object?> get props => [message];
}
