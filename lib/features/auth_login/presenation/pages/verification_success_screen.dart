import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/auth_background.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/home_indictor.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/login_primery_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationSuccessScreen extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback? onButtonPressed;

  const VerificationSuccessScreen({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          const AuthBackground(),
          SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 24.h, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16.h),
                  Center(
                    child: Text(
                      'Verify account',
                      style: AppTextStyles. styles.latoW600S16.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                     
                    ),
                  ),
                  SizedBox(height: 48.h),
                  Center(
                    child: Container(
                      width: 150,
                      padding: EdgeInsets.symmetric(
                        vertical: 28.h,
                        horizontal: 32.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.r),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 16.r,
                            offset: const Offset(0, 8),
                            color: Colors.black.withOpacity(0.10),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children:  [
                          CircleAvatar(
                            radius: 35.r,
                            backgroundColor: AppColors.primary,
                            child: Icon(
                              Icons.check,
                              size: 38.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles. styles.latoW600S22.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: AppTextStyles. styles.latoW400S14.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 14.sp,
                      height: 1.5.h ,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  PrimaryButton(
                    text: buttonText,
                    onPressed: onButtonPressed,
                  ),
                  SizedBox(height: 24.h),
                  const HomeIndicator(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}