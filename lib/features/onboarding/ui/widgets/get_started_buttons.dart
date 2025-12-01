import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constant/translation_keys.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_text_styles.dart';

class GetStartedButtons extends StatelessWidget {
  const GetStartedButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Login Button (filled with cardBackground)
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(
            onPressed: () {
              // Navigate to home for now (can be changed to login route later)
              context.go(Routes.homePage);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.cardBackground,
              foregroundColor: context.primaryText,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              elevation: 0,
            ),
            child: Text(
              TranslationKeys.onboardingLogin.tr(),
              style: AppTextStyles.styles.latoW600S16.copyWith(
                color: context.primaryText,
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        // Register Button (outlined with cardBackground border)
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: OutlinedButton(
            onPressed: () {
              // Navigate to home for now (can be changed to register route later)
              context.go(Routes.homePage);
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: context.cardBackground,
              side: BorderSide(color: context.cardBackground, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              TranslationKeys.onboardingRegister.tr(),
              style: AppTextStyles.styles.latoW600S16.copyWith(
                color: context.cardBackground,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
