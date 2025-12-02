import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constant/translation_keys.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/button_app.dart';

class GetStartedButtons extends StatelessWidget {
  const GetStartedButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Login Button (filled with cardBackground)
        ButtonApp(
          title: TranslationKeys.onboardingLogin.tr(),
          width: double.infinity,
          onPressed: () {
            // Navigate to home for now (can be changed to login route later)
            context.go(Routes.homePage);
          },
        ),
        SizedBox(height: 18.h),
        // Register Button (outlined with cardBackground border)
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: OutlinedButton(
            onPressed: () {
              context.go(Routes.homePage);
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: context.mainText,
              side: BorderSide(color: context.mainText, width: 2.5.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(31.r),
              ),
            ),
            child: Text(
              TranslationKeys.onboardingRegister.tr(),
              style: AppTextStyles.styles.latoW600S16.copyWith(
                color: context.mainText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
