import 'package:fintech_app/features/home/data/datasources/repos/home_repo.dart';
import 'package:fintech_app/features/home/data/home_servicea/api_client_service.dart';
import 'package:fintech_app/features/home/ui/cubits/home_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
    final getIt = GetIt.instance;

  // ======== Home ==========
  final dio = createDio(
    demoKey: 'CG-wcMwgtCgr4YU5ff8atbsD67W5',
    // proKey: '...'  // لو معاك مفتاح 
  );

  final apiClient = ApiClient(dio, baseUrl: dio.options.baseUrl);

  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository(apiClient));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt())..loadHome());


  //=============== home ==================
  // getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  // getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  // getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}



