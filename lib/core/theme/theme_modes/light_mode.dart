import '../app_text_styles.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_colors_theme.dart';
import 'package:flutter/material.dart';

ThemeData getLightModeTheme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryDark,
      brightness: Brightness.light,
    ),

    extensions: [
      AppColorsTheme(
        containerBackground: const Color(0xFFE3E5EA),
        cardBackground: Colors.white,
        cardBorderColor: const Color(0xFFE5E7EB),
        cardShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        primaryText: Colors.black,
        mainText: AppColors.primaryDark,
        secondaryText: AppColors.textSecondary,
        iconColor: Colors.black87,
        successBackground: AppColors.successLight,
        successPrimary: AppColors.successPrimaryLight,
        successText: AppColors.successPrimaryLight,
        errorBackground: AppColors.errorBackgroundLight,
        errorText: AppColors.errorTextLight,
        infoColor: AppColors.infoLight,
        divider: AppColors.dividerLight,
        toggleBackground: AppColors.neutral500.withValues(alpha: 0.3),
      ),
    ],

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      foregroundColor: AppColors.primaryDark,
      titleTextStyle: AppTextStyles.styles.latoW600S24,
    ),

    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 52),
        backgroundColor: AppColors.primaryDark,
        foregroundColor: Colors.white,
        disabledBackgroundColor: AppColors.textDisabled,
        disabledForegroundColor: Colors.white70,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTextStyles.styles.latoW400S16,
      ),
    ),

    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black45),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black45),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.errorPrimary),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryDark),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      labelStyle: TextStyle(color: Colors.black45),
    ),
  );
}
