// TODO: Do NOT add screen imports here. Add them in routes_exports.dart instead.
import 'package:dio/dio.dart';
import 'package:fintech_app/features/home/data/datasources/repos/home_repo.dart';
import 'package:fintech_app/features/home/data/home_servicea/api_client_service.dart';
import 'package:fintech_app/features/home/ui/cubits/home_cubit.dart';
import 'package:fintech_app/features/market/data/datasources/services/crypto_services/crypto_service.dart';
import 'package:fintech_app/features/market/ui/cubits/coins_cubit/crypto_market_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes_exports.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: Routes.homePage,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(child: child); // ثابت وفيه البوتوم ناف
      },
      routes: [
     
        GoRoute(
          path: Routes.homePage,
          name: Routes.homePage,
          builder: (context, state) {
            final dio = createDio();
            final apiClient = ApiClient(dio);
            final homeRepo = HomeRepository(apiClient);

            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) =>
                      HomeCubit(homeRepo)
                        ..loadHome(),
                ),
                BlocProvider(create: 
                (context) => CryptoMarketCubit(
                cryptoMarketService: CryptoMarketService(Dio()),
                  )),
              ],
              child: const HomePage(),
            );
          },
        ),

        /// Settings
        GoRoute(
          path: Routes.settings,
          name: Routes.settings,
          builder: (context, state) => const SettingScreen(),
        ),

        GoRoute(
          path: Routes.language,
          name: Routes.language,
          builder: (context, state) => const LanguageScreen(),
        ),

        /// Market
        GoRoute(
          path: Routes.cryptoMarket,
          name: Routes.cryptoMarket,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              // BlocProvider(

              //   create: (_) => CatergoryCubitCubit(
              //     categoryRepo: CategoryRepo(categoryService: CategoryService(Dio()))

              //   )..getCategories(),
              // ),
              BlocProvider(
                create: (_) => CryptoMarketCubit(
                  cryptoMarketService: CryptoMarketService(Dio()),
                ),
              ),
            ],
            child: const CryptoMarketScreen(),
          ),
        ),

        GoRoute(
          path: Routes.coinDetails,
          name: Routes.coinDetails,
          builder: (context, state) => const CoinDetailsScreen(),
        ),

        /// Payment
        GoRoute(
          path: Routes.buyCryptoScreen,
          name: Routes.buyCryptoScreen,
          builder: (context, state) => BlocProvider(
            create: (_) => PaymentCubit(),
            child: const BuyCryptoPage(),
          ),
        ),

        GoRoute(
          path: Routes.paymentMethodScreen,
          name: Routes.paymentMethodScreen,
          builder: (context, state) => const PaymentMethodScreen(amount: 100.0),
        ),

        GoRoute(
          path: Routes.portfolioScreen,
          name: Routes.portfolioScreen,
          builder: (context, state) => const PortfolioScreen(),
        ),

        GoRoute(
          path: Routes.loginPage,
          name: Routes.loginPage,
          builder: (context, state) => const LoginPage(),
        ),

        GoRoute(
          path: Routes.faceIdScanPage,
          name: Routes.faceIdScanPage,
          builder: (context, state) => const FaceIdScanPage(),
        ),

        GoRoute(
          path: Routes.faceIdVerifiedPage,
          name: Routes.faceIdVerifiedPage,
          builder: (context, state) => const FaceIdVerifiedPage(),
        ),

        GoRoute(
          path: Routes.fingerprintScanPage,
          name: Routes.fingerprintScanPage,
          builder: (context, state) => const FingerprintScanPage(),
        ),
      ],
    ),
  ],
);
