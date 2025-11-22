// TODO: Do NOT add screen imports here. Add them in routes_exports.dart instead.

import 'routes.dart';
import 'routes_exports.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
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
  ],
);
