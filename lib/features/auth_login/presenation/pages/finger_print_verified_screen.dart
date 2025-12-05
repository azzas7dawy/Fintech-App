import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/features/auth_login/presenation/pages/verification_success_screen.dart';
import 'package:flutter/material.dart';

class FingerprintVerifiedPage extends StatelessWidget {
  const FingerprintVerifiedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return VerificationSuccessScreen(
      title: "verified_title".tr(),
      description: "verified_desc".tr(),
      buttonText: "continue_home".tr(),
      onButtonPressed: () {},
    );
  }
}
