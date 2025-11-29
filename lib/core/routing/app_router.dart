
import 'package:fintech_app/core/routing/routes.dart';
import 'package:fintech_app/features/market/ui/screens/coins_details_screen.dart';

import 'package:fintech_app/features/payment/presentation/cubits/payment_cubit.dart';
import 'package:fintech_app/features/payment/presentation/pages/buy_screen.dart';
import 'package:fintech_app/features/payment/presentation/pages/payment_method_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routes_exports.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/buyCryptoScreen',
  routes: <GoRoute>[
    GoRoute(
      path: '/buyCryptoScreen',
      name: 'buy',
       builder: (context, state) => BlocProvider(
        create: (_) => PaymentCubit() ,
        child: const BuyCryptoPage(),

      ),
    ),
// GoRoute(
//   path: '/paymentScreen',
//   builder: (context, state) {
//     final passedCubit = state.extra as PaymentCubit?;
//     if (passedCubit != null) {
//       return BlocProvider.value(
//         value: passedCubit,
//         child: const PaymentMethodPage(),
//       );
//     } else {
//       // fallback: create new
//       return BlocProvider(create: (_) => PaymentCubit(), child: const PaymentMethodPage());
//     }
//   },

// ),

     GoRoute(
      path: '/paymentMethodScreen',
      name: 'payment',
     builder: (context, state) => const PaymentMethodScreen(amount: 100.0),
  initialLocation: Routes.coinsDetailsScreen,
  routes: <GoRoute>[
    GoRoute(
      path: 'demo',
      name: 'demo',
      builder: (context, state) => const DemoScreen(),
    ),

     GoRoute(
      path: Routes.coinsDetailsScreen ,
      name: 'coins details screen',
      builder: (context, state) => const CoinsDetailsScreen(),
    ),
  ],
);
