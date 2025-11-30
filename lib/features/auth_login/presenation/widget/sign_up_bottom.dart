 import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BottomSignUpText extends StatelessWidget {
  const BottomSignUpText();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
           Text(
            "Don't have an account? ",
            style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.textSecondary,
            ),
          ),
          GestureDetector(
            onTap: () {
           
            },
            child:  Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.mainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}