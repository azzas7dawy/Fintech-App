
  import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCardTypeChip(
    String text, {
    bool selected = false,
    Image? logoImage,
  }) {
    return Expanded(
      child: Container(
    
        height: 36.h,
        decoration: BoxDecoration(
              color: AppColors.mainColor,
          // color: selected ? _primaryDark : _lightBox,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: logoImage != null
              ? Image(
                  
                  // color: selected ? Colors.white : _primaryDark,
                  image: logoImage.image,
                )
              : Text(
                  text,
                  style: TextStyle(
                    // color: selected ? Colors.white : _primaryDark,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
        ),
      ),
    );
  }