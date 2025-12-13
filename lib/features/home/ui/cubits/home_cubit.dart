// lib/features/home/ui/cubits/home_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:fintech_app/features/home/data/datasources/repos/home_repo.dart';
import 'package:fintech_app/features/home/data/models/trending_response.dart';
import 'package:fintech_app/features/home/data/models/top_gainers_response.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repo;
  HomeCubit(this.repo) : super(HomeInitial());

  Future<void> loadHome() async {
    emit(HomeLoading());
    try {
      final aggregate = await repo.fetchHome();
      emit(HomeLoaded(trending: aggregate.trending, gainers: aggregate.gainers));

      // debug print (temporarily helpful)
      // ignore: avoid_print
      print('HomeLoaded -> trending: ${aggregate.trending.length}, gainers: ${aggregate.gainers.length}');
    } on DioError catch (dioErr) {
      final msg = dioErr.response?.data?.toString() ?? dioErr.message;
      emit(HomeError(message: 'Network error: $msg'));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }

  Future<void> refreshTrending() async {
    if (state is HomeLoaded) {
      try {
        final trending = await repo.getTrendingCoins();
        final current = state as HomeLoaded;
        emit(HomeLoaded(trending: trending, gainers: current.gainers));
      } on DioError catch (dioErr) {
        final msg = dioErr.response?.data?.toString() ?? dioErr.message;
        emit(HomeError(message: 'Failed to refresh trending: $msg'));
      } catch (e) {
        emit(HomeError(message: 'Failed to refresh trending: $e'));
      }
    }
  }

  Future<void> refreshGainers() async {
    if (state is HomeLoaded) {
      try {
        final gainers = await repo.getTopGainersFromMarkets();
        final current = state as HomeLoaded;
        emit(HomeLoaded(trending: current.trending, gainers: gainers));
      } on DioError catch (dioErr) {
        final msg = dioErr.response?.data?.toString() ?? dioErr.message;
        emit(HomeError(message: 'Failed to refresh gainers: $msg'));
      } catch (e) {
        emit(HomeError(message: 'Failed to refresh gainers: $e'));
      }
    }
  }
}
