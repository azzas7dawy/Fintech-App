import 'package:dio/dio.dart';
import 'package:fintech_app/core/networking/api_end_pontis.dart';
import 'package:fintech_app/features/demo/data/model/movie_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'demo_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoints.baseUrl)
abstract class DemoApiService {
  factory DemoApiService(Dio dio) = _DemoApiService;

  @GET(ApiEndPoints.popularMovies)
  Future<MovieResponse> getPopularMovies({
   @Query('page') required int page
    }
  );
}
