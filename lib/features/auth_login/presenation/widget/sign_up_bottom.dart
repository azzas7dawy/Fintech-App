 import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
class BottomSignUpText extends StatelessWidget {
  const BottomSignUpText();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          const Text(
            "Don't have an account? ",
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
          GestureDetector(
            onTap: () {
              // TODO: go to Sign Up
            },
            child: const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 16,
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