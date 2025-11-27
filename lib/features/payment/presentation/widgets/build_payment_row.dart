
  import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
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
          height: 56,
          width:343 ,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color:  Colors.white,
          ),
         
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mainColor
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.mainColor,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }