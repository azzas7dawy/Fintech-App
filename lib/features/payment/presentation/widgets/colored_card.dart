
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomColoredCard extends StatelessWidget {
  const CustomColoredCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF3B5AFB),
            Color(0xFF8A2BE2),
          ],
        ),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const Row(
             children: [
               Icon(
                Icons.bolt, // أيقونة شبه اللي في التصميم
                color: AppColors.darkLightContainerColor,
                                       ),
                                       Spacer(),
                                       Image(image: AssetImage('assets/images/Group 2.png'))
             ],
           ),
           const SizedBox(height: 20),
           const Text(
            '8629  9257  0928  3456',
            style: TextStyle(
              color: AppColors.darkLightGroundColor,
              fontSize: 18,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w500,
            ),
          ),
           const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'VALID THRU',
                    style:AppTextStyles.styles.latoW400S10.copyWith(
                      color: AppColors.darkLightContainerColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                   Text(
                    '09/24',
                    style: AppTextStyles.styles.latoW400S12.copyWith(
                      color: AppColors.darkLightGroundColor,
                    ),
                  ),
                ],
              ),
            
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text(
                'Arafat Alam',
                style: 
                TextStyle(
                  color: AppColors.darkLightGroundColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
        const Spacer(),
                Text(
                'VISA',
                style: AppTextStyles.styles.latoW600S16.copyWith(
                  color: AppColors.darkLightGroundColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}