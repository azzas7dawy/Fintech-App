
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:testing_in_flutter/core/networking/api_result.dart';
// import 'package:testing_in_flutter/features/home/data/model/movie_model.dart';
// import 'package:testing_in_flutter/features/home/data/repos/home_repo.dart';

// part 'home_state.dart';

// class HomeCubit extends Cubit<HomeState> {
//   final HomeRepo homeRepo;

  

//   HomeCubit(this.homeRepo) : super(HomeInitial());

//   emitPopularMoviesStates() async {
//     emit(HomePopularMoviesLoading());
//     final result = await homeRepo.getPopularMovies(1);
//     result.when(
//       success: (popularMoviesList) {
//         emit(HomePopularMoviesSuccess(popularMoviesList: popularMoviesList));
//       },
//       failure: (errorModel) {
//         emit(HomePopularMoviesFailure(errMsg: errorModel.message));
//       },
//     );
//   }
// }
