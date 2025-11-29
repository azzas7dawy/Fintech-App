import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/constant/translation_keys.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/assets.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/setting_item.dart';
import '../widgets/custom_toggle_switch.dart';
import '../widgets/profile_header.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 20.0.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TranslationKeys.settings.tr(),
                  style: AppTextStyles.styles.latoW700S24.copyWith(
                    color: isDark ? Colors.white : AppColors.primaryDark,
                  ),
                ),
                SizedBox(height: 23.0.h),
                const ProfileHeader(
                  imageUrl:
                      'https://mockmind-api.uifaces.co/content/human/219.jpg',
                  userName: 'Sophia Isabella',
                ),
                SizedBox(height: 30.0.h),
                Text(
                  TranslationKeys.general.tr(),
                  style: AppTextStyles.styles.latoW600S16.copyWith(
                    color: isDark ? Colors.white : AppColors.primaryDark,
                  ),
                ),
                SizedBox(height: 20.0.h),
                SettingItem(
                  iconName: Assets.imagesProfile,
                  title: TranslationKeys.myAccount.tr(),
                  onTap: () {
                    // TODO: Navigate to crypto market screen
                    context.push(Routes.cryptoMarket);
                  },
                ),
                SizedBox(height: 15.0.h),
                Divider(
                  color: AppColors.neutral500,
                  endIndent: 4.0.w,
                  indent: 4.0.w,
                ),
                SizedBox(height: 15.0.h),
                SettingItem(
                  iconName: Assets.imagesWallet,
                  title: TranslationKeys.billingPayment.tr(),
                  onTap: () {},
                ),
                SizedBox(height: 15.0.h),
                Divider(
                  color: AppColors.neutral500,
                  endIndent: 4.0.w,
                  indent: 4.0.w,
                ),
                SizedBox(height: 15.0.h),
                SettingItem(
                  iconName: Assets.imagesFAQ,
                  title: TranslationKeys.faqSupport.tr(),
                  onTap: () {},
                ),

                SizedBox(height: 30.0.h),
                Text(
                  TranslationKeys.settings.tr(),
                  style: AppTextStyles.styles.latoW600S16.copyWith(
                    color: isDark ? Colors.white : AppColors.primaryDark,
                  ),
                ),
                SizedBox(height: 20.0.h),
                SettingItem(
                  iconName: Assets.imagesLanguage,
                  title: TranslationKeys.language.tr(),
                  onTap: () {
                    context.push(Routes.language);
                  },
                ),
                SizedBox(height: 15.0.h),
                Divider(
                  color: AppColors.neutral500,
                  endIndent: 4.0.w,
                  indent: 4.0.w,
                ),
                SizedBox(height: 15.0.h),

                Row(
                  children: [
                    CircleAvatar(
                      radius: 15.0.r,
                      backgroundColor: isDark
                          ? AppColors.primaryDark
                          : AppColors.infoSecondary,
                      child: SvgPicture.asset(Assets.imagesMoon),
                    ),
                    SizedBox(width: 15.0.w),
                    Text(
                      TranslationKeys.darkMode.tr(),
                      style: AppTextStyles.styles.latoW600S16.copyWith(
                        color: isDark ? Colors.white : AppColors.primaryDark,
                      ),
                    ),
                    const Spacer(),
                    const CustomToggleSwitch(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
