
import 'package:fintech_app/core/constant/app_constant.dart';
import 'package:fintech_app/features/demo/data/model/movie_model.dart';
import 'package:hive/hive.dart';

class DemoLocalData {
  static const String popularMoviesBox = AppConstant.popularMoviesBox;

  final movieBox = Hive.box<MovieModel>(popularMoviesBox);

  //================= store movies in hive ==============
  Future<void> storePopularMovies(List<MovieModel> movies) async {
    await movieBox.clear(); // Clear previous cached movies
    await movieBox.addAll(movies);
  }

  //================= get Movies from hive ==============
  List<MovieModel> getCachedPopularMovies() {
    if (movieBox.isEmpty) return [];
    return movieBox.values.toList();
  }
}
