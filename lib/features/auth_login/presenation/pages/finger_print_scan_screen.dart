import 'package:fintech_app/features/auth_login/presenation/pages/finger_print_verified_screen.dart';
import 'package:flutter/material.dart';
import 'biometric_scan_screen.dart';


class FingerprintScanPage extends StatelessWidget {
  const FingerprintScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BiometricScanScreen(
      title: 'Touch ID sensor to verify yourself',
      description:
          'Please verify your identity using touch ID and it will proceed automatically.',
      icon: Icons.fingerprint, //  البصمة
      onAuthenticated: (ctx) {
        Navigator.of(ctx).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const FingerprintVerifiedPage(),
          ),
        );
      },
    );
  }
}
