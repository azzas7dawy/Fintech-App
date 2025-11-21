import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!.options.connectTimeout = timeOut;
      dio!.options.receiveTimeout = timeOut;

      addDioHeader();

      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static addDioHeader() async {
    dio!.options.headers = {
      'Accept': 'application/json',
    };
  }

  static refrshToken({required String token}){
    dio!.options.headers = {
      'Authorization': "Bearer $token", // get token from shared pref
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        responseBody: true,
        error: true,
        requestHeader: true,
        // responseHeader: true,
      ),
    );
  }
}