// TODO: Do NOT add screen imports here. Add them in routes_exports.dart instead
import 'package:go_router/go_router.dart';

import 'routes.dart';
import 'routes_exports.dart' ;

final GoRouter appRouter = GoRouter(
  initialLocation: '/loginPage',
  routes: <GoRoute>[
    // GoRoute(
    //   path: '/',azzaSAD123##
    //   name: Routes.demoScreen,
    //   builder: (context, state) => const DemoScreen(),

    // ),
    GoRoute(
      path: Routes.loginPage,
      name: Routes.loginPage,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
  path: Routes.homePage,
  name: Routes.homePage,
  builder: (context, state) => const DemoScreen(),
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
);
