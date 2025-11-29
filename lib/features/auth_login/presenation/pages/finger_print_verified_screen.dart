import 'package:fintech_app/features/auth_login/presenation/pages/verification_success_screen.dart';
import 'package:flutter/material.dart';

class FingerprintVerifiedPage extends StatelessWidget {
  const FingerprintVerifiedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return VerificationSuccessScreen(
      title: "You're verified",
      description:
          "You have been verified your information completely. Let's make transactions!",
      buttonText: 'Continue To Home',
      onButtonPressed: () {
        // TODO: روحي للـ Home Screen الحقيقية
        // Navigator.pushReplacement(...);
      },
    );
  }
}
