import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/auth_background.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/home_indictor.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/icon_info_card.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/login_primery_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaceIdVerifiedPage extends StatelessWidget {
  const FaceIdVerifiedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          const AuthBackground(),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 46.h),

                  SizedBox(height: 112.h),

                  Center(
                    child: IconInfoCard(
                      size: 150.w,
                      padding: EdgeInsets.symmetric(
                        vertical: 28.h,
                        horizontal: 32.w,
                      ),
                      icon: Container(
                        width: 70.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: AppColors.darkBlue,
                            width: 2.r,
                          ),
                        ),
                        child: Icon(
                          Icons.check,
                          size: 38.sp,
                          color: AppColors.darkBlue,
                        ),
                      ),
                      title: "face_id".tr(),
                    ),
                  ),

                  SizedBox(height: 40.h),

                  Text(
                    "verified_title".tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.styles.latoW600S22.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    "verified_desc".tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.styles.latoW400S14.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 14.sp,
                      height: 1.5.h,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),

                  PrimaryButton(text: "continue_home".tr(), onPressed: () {}),
                  SizedBox(height: 24.h),
                  const HomeIndicator(color: Colors.black54),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
