
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

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
        width: 64,
        height: 64,
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.circular(40),
        //   boxShadow: [
        //     BoxShadow(
        //       blurRadius: 10,
        //       offset: const Offset(0, 4),
        //       color: Colors.black.withOpacity(0.06),
        //     ),
        //   ],
        // ),
        child: 
          Center(child:Image(image: icon.image, width:50, height:50,)),
        // Icon(
        //   icon,
        //   size: 30,
        //   color: AppColors.primary,
        // ),
      ),
    );
  }
}