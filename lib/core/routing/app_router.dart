import 'package:fintech_app/features/demo/ui/demo_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: 'demo',
      builder: (context, state) => const DemoScreen(),
    ),
  ],
);
