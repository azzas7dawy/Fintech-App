
  import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 Widget buildPaymentRow({
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          height: 56.h,
          width:343.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color:  AppColors.darkLightContainerColor,
          ),
         
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  title,
                  style: 
                  AppTextStyles.styles.latoW500S14.copyWith(
                    color: AppColors.mainColor,
                  ),
                ),
                const Spacer(),
                 Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.mainColor,
                  size: 16.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  
}
