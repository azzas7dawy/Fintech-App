
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleIconButton extends StatelessWidget {
  final Image icon;
  final VoidCallback? onTap;

   CircleIconButton({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: onTap,
      child: Container(
        width: 64.h,
        height: 64.h,
     
        child: 
          Center(child:Image(image: icon.image, width:50.w, height:50.h,)),
        // Icon(
        //   icon,
        //   size: 30,
        //   color: AppColors.primary,
        // ),
      ),
    );
  }
}