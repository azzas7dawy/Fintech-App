import 'package:fintech_app/core/shared/app_text_styles.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData getDarkModeTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkModeBackGroundColor,

    //=======================  الحاجات اللي مش بتاخد لون زي مثلا ال مسطره
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.gray400,
      brightness: Brightness.dark,
    ),

    //======================= app bar =======================
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkModeBackGroundColor,
      foregroundColor: Colors.white,

      titleTextStyle: AppTextStyles.headingLarge.copyWith(color: Colors.white),
    ),

    //======================= text theme=======================
    textTheme: ThemeData.light().textTheme.apply(bodyColor: Colors.white),

    //======================= btns =======================
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 52),

        backgroundColor: Colors.white,
        foregroundColor: AppColors.mainColor,

        //================= onpressed  مفيش  معطل ====
        // disabledBackgroundColor: AppColors.gray800,
        // disabledForegroundColor: AppColors.gray400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),

          side: const BorderSide(color: AppColors.gray700),
        ),
        textStyle: AppTextStyles.bodyMedium,
      ),
    ),

    //====================== input decoration theme  borders ==============================
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
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.mainColor),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      fillColor: AppColors.gray800,
      filled: true,
      labelStyle: AppTextStyles.bodyMedium,
      hintStyle: AppTextStyles.bodyLarge,
    ),
  );
}
