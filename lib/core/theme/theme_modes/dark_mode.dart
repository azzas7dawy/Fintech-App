import '../app_text_styles.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_colors_theme.dart';
import 'package:flutter/material.dart';

ThemeData getDarkModeTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.textSecondary,
      brightness: Brightness.dark,
    ),

    extensions: const [
      AppColorsTheme(
        containerBackground: AppColors.surfaceVariant,
        cardBackground: AppColors.surfaceVariant,
        cardBorderColor: Colors.white10,
        cardShadow: [],
        primaryText: Colors.white,
        mainText: Colors.white,
        secondaryText: Color(0xFFB0B0B0),
        textOnDark: AppColors.white,
        iconColor: Colors.white70,
        iconBackground: AppColors.iconBackgroundDark,
        successBackground: AppColors.successDark,
        successPrimary: AppColors.successPrimaryDark,
        successText: AppColors.successPrimaryDark,
        errorBackground: AppColors.errorBackgroundDark,
        errorText: AppColors.errorTextDark,
        infoColor: AppColors.infoDark,
        divider: AppColors.dividerDark,
        toggleBackground: AppColors.primaryDark,
        textGreen: AppColors.textGreenDark,
        portfolioSelectedTextTabBar: AppColors.white,
        portfolioBackgroundSelectedTabBar: AppColors.containerDark,
      ),
    ],

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      foregroundColor: Colors.white,
      titleTextStyle: AppTextStyles.styles.latoW600S24.copyWith(
        color: Colors.white,
      ),
    ),

    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 52),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.borderPrimary),
        ),
        textStyle: AppTextStyles.styles.latoW400S14,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black45),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black45),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.errorPrimary),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      fillColor: AppColors.surfaceVariant,
      filled: true,
      labelStyle: AppTextStyles.styles.latoW400S14,
      hintStyle: AppTextStyles.styles.latoW400S16,
    ),
  );
}
