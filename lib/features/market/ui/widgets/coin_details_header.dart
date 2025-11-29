import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinDetailsHeader extends StatelessWidget {
  const CoinDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 36.w,
              height: 36.h,

              decoration: BoxDecoration(
                color: isDark ? AppColors.lightOrange : Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.currency_bitcoin,
                color: !isDark ? AppColors.lightOrange : Colors.white,
              ),
            ),
            SizedBox(width: 12.w),
            Text('Bitcoin', style: AppTextStyles.styles.latoW700S20),
          ],
        ),

        //   Container(
        //     padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        //     decoration: BoxDecoration(
        //       color: isDark ? AppColors.darkModeContainerColor : AppColors.mainColor,
        //       borderRadius: BorderRadius.circular(20.r),
        //     ),
        //     child: Row(
        //       children: [
        //         Icon(Icons.show_chart, size: 14.w, color: Colors.white),
        //         SizedBox(width: 4.w),
        //         Text(
        //           '3.12%',
        //           style: AppTextStyles.styles.latoW600S12.copyWith(
        //             color: Colors.white,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ],
      ],
    );
  }
}
