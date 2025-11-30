import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/features/auth_login/presenation/pages/face_id_scan_screen.dart';
import 'package:fintech_app/features/auth_login/presenation/pages/finger_print_scan_screen.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/circle_item_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrDivider extends StatelessWidget {
  const OrDivider();

  @override
  Widget build(BuildContext context) {
    return  Row(
      children:  [
        Expanded(child: Divider(thickness: 0.7)),
        SizedBox(width: 8.w),
        Text(
          'Or login with',
          style: AppTextStyles. styles.latoW400S14.copyWith(
            color: AppColors.shadowColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(child: Divider(thickness: 0.7.h)),
      ],
    );
  }
}

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
         SizedBox(width: 24.w),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const FaceIdScanPage()));
          }, 
          child: CircleIconButton(icon: Image.asset('assets/images/face id.png'))),
      ],
    );
  }
}