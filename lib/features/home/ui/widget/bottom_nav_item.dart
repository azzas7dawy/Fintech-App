import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class BottomNavItem extends StatelessWidget {
  final String image;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomNavItem({
    Key? key,
    required this.image,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryDark
                  : Colors.transparent, // أو لون خفيف لو عايز
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(6.w),
            child: Image.asset(
              image,
              width: 26.w,
              height: 26.h,

              // الأيقونة نفسها مش هتلون لو الـ item selected
              color: isSelected ? Colors.white : context.secondaryText,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected ? AppColors.primaryDark : context.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}
