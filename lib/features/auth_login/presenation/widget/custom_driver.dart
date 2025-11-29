import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/features/auth_login/presenation/pages/face_id_scan_screen.dart';
import 'package:fintech_app/features/auth_login/presenation/pages/finger_print_scan_screen.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/circle_item_bottom.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children:  [
        Expanded(child: Divider(thickness: 0.7)),
        SizedBox(width: 8),
        Text(
          'Or login with',
          style: TextStyle(
            fontSize: 13,
            color: AppColors.mainColor,
          ),
        ),
        SizedBox(width: 8),
        Expanded(child: Divider(thickness: 0.7)),
      ],
    );
  }
}

/// أيقونات البصمة / الفيس في دوائر
class SocialRow extends StatelessWidget {
  const SocialRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
        onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const FingerprintScanPage()));
          }, 
          child: CircleIconButton(icon: Image.asset('assets/images/Group finger.png'))),
        const SizedBox(width: 24),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const FaceIdScanPage()));
          }, 
          child: CircleIconButton(icon: Image.asset('assets/images/face id.png'))),
      ],
    );
  }
}