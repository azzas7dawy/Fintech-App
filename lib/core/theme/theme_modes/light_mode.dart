import '../app_text_styles.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData getLightModeTheme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,

    //=======================  الحاجات اللي مش بتاخد لون زي مثلا ال مسطره
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.mainColor,
      brightness: Brightness.light,
    ),

    //======================= app bar =======================
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.mainColor,
      titleTextStyle: AppTextStyles.styles.latoW600S24,
    ),

    //======================= text theme=======================
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ),

    //======================= btns =======================
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 52),

        backgroundColor: AppColors.mainColor,
        foregroundColor: Colors.white,

        //================= onpressed  مفيش  معطل ====
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.grey[300],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTextStyles.styles.latoW400S16,
      ),
    ),

    //====================== input decoration theme  borders ==============================
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
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.mainColor),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      labelStyle: TextStyle(color: Colors.black45),
    ),
  );
}
