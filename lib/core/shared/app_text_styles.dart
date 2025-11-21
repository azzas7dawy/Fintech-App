import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  // Primary text styles with main color as default
  static TextStyle get headingLarge => TextStyle(
    color: AppColors.mainColor,
    fontWeight: FontWeight.w600,
    fontSize: 24.sp,
    fontFamily: 'Poppins',
  );

  static TextStyle get headingMedium => TextStyle(
    color: AppColors.mainColor,
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
    fontFamily: 'Poppins',
  );

  static TextStyle get headingSmall => TextStyle(
    color: AppColors.mainColor,
    fontWeight: FontWeight.w600,
    fontSize: 18.sp,
    fontFamily: 'Poppins',
  );

  static TextStyle get bodyLarge => TextStyle(
    color: AppColors.mainColor,
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    fontFamily: 'Poppins',
  );

  static TextStyle get bodyMedium => TextStyle(
    color: AppColors.mainColor,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    fontFamily: 'Poppins',
  );

  static TextStyle get bodySmall => TextStyle(
    color: AppColors.mainColor,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    fontFamily: 'Poppins',
  );

  static TextStyle get labelLarge => TextStyle(
    color: AppColors.mainColor,
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    fontFamily: 'Poppins',
  );

  static TextStyle get labelMedium => TextStyle(
    color: AppColors.mainColor,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
    fontFamily: 'Poppins',
  );

  static TextStyle get labelSmall => TextStyle(
    color: AppColors.mainColor,
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    fontFamily: 'Poppins',
  );

  // Hint text styles
  static TextStyle get hintStyle => TextStyle(
    color: AppColors.gray,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    fontFamily: 'Poppins',
  );

  // Secondary text styles
  static TextStyle get secondaryText => TextStyle(
    color: const Color(0xffE0E0E0),
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    fontFamily: 'Poppins',
  );

  // Custom color methods
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }

  static TextStyle withSize(TextStyle style, double size) {
    return style.copyWith(fontSize: size.sp);
  }
}
