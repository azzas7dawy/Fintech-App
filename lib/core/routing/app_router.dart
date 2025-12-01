// TODO: Do NOT add screen imports here. Add them in routes_exports.dart instead.
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes_exports.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: Routes.splash,

  routes: [
    /// Splash Screen
    GoRoute(
      path: Routes.splash,
      name: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),

    /// Onboarding (outside ShellRoute - no bottom nav)
    GoRoute(
      path: Routes.onboarding,
      name: Routes.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),

    /// ---------- MAIN LAYOUT WITH BOTTOM NAV ----------
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(child: child); // ثابت وفيه البوتوم ناف
      },

      routes: [
        /// Home
        GoRoute(
          path: Routes.homePage,
          name: Routes.homePage,
          builder: (context, state) => const HomePage(),
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
          builder: (context, state) => const CryptoMarketScreen(),
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
      ],
    ),
  ],
);
