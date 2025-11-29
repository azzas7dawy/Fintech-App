import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:  [
        Text(
          'Login To Your Account',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: AppColors.mainColor,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
         Column(
          
           children: [
             Text(
              "Welcome back you've ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.shadowColor,
              ),
              textAlign: TextAlign.center,
                   ),
                     Text(
              " been missed!",
              style: TextStyle(
                fontSize: 16,
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