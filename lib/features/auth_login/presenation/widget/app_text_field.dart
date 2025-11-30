import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;

  const AppTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.gray800,
            width: 1,
          ),
          
        ),
        hintText: hintText,
        hintStyle:  TextStyle(
          fontSize: 13.sp,
          color: AppColors.textSecondary,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, size: 20.sp, color: AppColors.textSecondary)
            : null,
        contentPadding:
            EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: AppColors.inputBorder,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: AppColors.mainColor,
            width: 1.2,
          ),
        ),
      ),
    );
  }
}