// TODO: Do NOT add screen imports here. Add them in routes_exports.dart instead.

import 'package:fintech_app/features/auth_login/presenation/pages/face_id_scan_screen.dart';
import 'package:fintech_app/features/auth_login/presenation/pages/face_id_verified_screen.dart';
import 'package:fintech_app/features/auth_login/presenation/pages/finger_print_scan_screen.dart';
import 'package:fintech_app/features/auth_login/presenation/pages/login_screen.dart';

import 'routes_exports.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/loginPage',
  routes: <GoRoute>[
    // GoRoute(
    //   path: '/',azzaSAD123##
    //   name: 'demo',
    //   builder: (context, state) => const DemoScreen(),

    // ),
    GoRoute(
      path: '/loginPage',
      name: 'loginPage',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
  path: '/homePage',
  name: 'homePage',
  builder: (context, state) => const DemoScreen(),
),
     GoRoute(
      path: '/faceIdScanPage',
      name: 'faceIdScanPage',
      builder: (context, state) => const FaceIdScanPage(),
    ),
     GoRoute(
      path: '/faceIdVerifiedPage',
      name: 'faceIdVerifiedPage',
      builder: (context, state) => const FaceIdVerifiedPage(),
    ),

    GoRoute(
  
     path: '/fingerprintScanPage',
     name: 'fingerprintScanPage',
builder: (context, state) => const FingerprintScanPage(),
    ),
  ],
);
