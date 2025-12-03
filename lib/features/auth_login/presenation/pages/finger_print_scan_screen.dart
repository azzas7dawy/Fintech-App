import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/features/auth_login/presenation/pages/finger_print_verified_screen.dart';
import 'package:flutter/material.dart';
import 'biometric_scan_screen.dart';


class FingerprintScanPage extends StatelessWidget {
  const FingerprintScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BiometricScanScreen(
      title:   "touch_id_title".tr(),
      description:
         "touch_id_desc".tr(),
      icon: Icons.fingerprint, 
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
