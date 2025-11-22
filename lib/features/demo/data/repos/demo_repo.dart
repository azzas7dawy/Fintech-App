import 'package:dio/dio.dart';
import 'package:fintech_app/core/networking/api_result.dart';
import 'package:fintech_app/features/demo/data/datasources/remote/demo_api_service.dart';
import 'package:fintech_app/features/demo/data/datasources/local/demo_local_data.dart';
import 'package:fintech_app/features/demo/data/model/movie_model.dart';

class DemoRepo {
  DemoApiService demoApiService;
  DemoRepo(this.demoApiService);

  DemoLocalData demoLocalData = DemoLocalData();

  // حجم الصفحة الافتراضي (عدد الأفلام في كل تحميل) - reusable لأي pagination
  // static const int _pageSize = 20;

  Future<ApiResult<List<MovieModel>>> getPopularMovies(int page) async {
    try {

      final response = await demoApiService.getPopularMovies(page: page);


      return ApiResult.success(response.results);
    } 
    on DioException {

      return const ApiResult.failure('');
    }
     catch (e) {
    
      return const ApiResult.failure('');
    }
  }
}
