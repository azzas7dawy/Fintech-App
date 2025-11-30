import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:  [
        Text(
          'Login To Your Account',
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.mainColor,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
         Column(
          
           children: [
             Text(
              "Welcome back you've ",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.shadowColor,
              ),
              textAlign: TextAlign.center,
                   ),
                     Text(
              " been missed!",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                  color: AppColors.shadowColor,
              ),
              textAlign: TextAlign.center,
                   ),
           ],
         ),
      ],
    );
  }
}