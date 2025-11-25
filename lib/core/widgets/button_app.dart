import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_text_styles.dart';

class ButtonApp extends StatelessWidget {
  const ButtonApp({
    super.key,
    required this.title,
    required this.onPressed,
    this.textColor,
    this.backgroundColor,
    this.foregroundColor,
  });
  final String title;
  final VoidCallback onPressed;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? foregroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(0.w, 50.h),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(31.r),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: AppTextStyles.styles.latoW700S18.copyWith(color: textColor),
      ),
    );
  }
}
