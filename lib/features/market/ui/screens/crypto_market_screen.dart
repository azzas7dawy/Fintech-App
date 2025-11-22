import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/translation_keys.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/crypto_market_tabbar.dart';
import '../widgets/search_text_field.dart';

class CryptoMarketScreen extends StatelessWidget {
  const CryptoMarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Scaffold(
      backgroundColor: isDark
          ? AppColors.darkModeBackGroundColor
          : AppColors.backgroundLightModeColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 20.0.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TranslationKeys.cryptoMarket.tr(),
                  style: AppTextStyles.styles.latoW700S24.copyWith(
                    color: isDark ? Colors.white : AppColors.mainColor,
                  ),
                ),
                SizedBox(height: 16.0.h),
                SearchTextField(isDark: isDark),
                SizedBox(height: 16.0.h),
                DefaultTabController(
                  length: 5,
                  child: CryptoMarketTabBar(isDark: isDark),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
