// TODO: Do NOT add screen imports here. Add them in routes_exports.dart instead.

import 'package:fintech_app/core/routing/routes.dart';
import 'package:fintech_app/features/payment/presentation/cubits/payment_cubit.dart';
import 'package:fintech_app/features/payment/presentation/pages/buy_screen.dart';
import 'package:fintech_app/features/payment/presentation/pages/payment_method_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes_exports.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: Routes.cryptoMarket,
  routes: <GoRoute>[
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
    // Payment routes
    GoRoute(
      path: Routes.buyCryptoScreen,
      name: 'buy',
      builder: (context, state) => BlocProvider(
        create: (_) => PaymentCubit(),
        child: const BuyCryptoPage(),
      ),
    ),
    GoRoute(
      path: Routes.paymentMethodScreen,
      name: 'payment',
      builder: (context, state) => const PaymentMethodScreen(amount: 100.0),
    ),
  ],
);
