import 'package:fintech_app/core/shared/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SharedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final double? height;
  final double? borderWidth;
  final Color? backgroundColor;
  final Gradient? backgroundGradient;
  final Color? textColor;
  final Color? borderColor;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final Widget? icon;
  final FontWeight? fontWeight;
  final double? fontSize;
  final bool? hasBorder;

  const SharedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width,
    this.height ,
    this.backgroundColor,
    this.backgroundGradient,
    this.textColor,
    this.borderRadius = 8.0,
    this.padding,
    this.icon,
    this.borderColor,
    this.borderWidth,
    this.fontWeight,
    this.hasBorder,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius.r),
          border: Border.all(
            color: borderColor ?? backgroundColor!,
            width: borderWidth ?? 0,
          ),
        ),
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            fixedSize: Size(width ?? double.infinity, height ?? 56 ),
            backgroundColor: backgroundColor,
            shadowColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius.r),
            ),
            padding:
                padding ??
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
          ),
          child: isLoading
              ? SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) ...[icon!, SizedBox(width: 8.w)],
                    Text(
                      text,
                      style: AppTextStyles.labelMedium.copyWith(
                        color: textColor ?? Colors.white,
                        fontWeight: fontWeight ?? FontWeight.w600,
                        fontSize: fontSize ?? 16.sp,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
