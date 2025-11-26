
import 'package:fintech_app/core/routing/routes.dart';
import 'package:fintech_app/features/market/ui/screens/coins_details_screen.dart';

import '../../features/home/ui/screens/home_page.dart';
import 'routes_exports.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: Routes.homePage,
  routes: <GoRoute>[
    GoRoute(
      path: Routes.homePage,
      name: 'home page',
      builder: (context, state) => const HomePage(),
    ),
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
