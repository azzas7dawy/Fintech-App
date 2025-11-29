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
                color: isDark ? AppColors.accent : Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.currency_bitcoin,
                color: isDark ? Colors.white : AppColors.accent,
              ),
            ),
            SizedBox(width: 12.w),
            Text('Bitcoin', style: AppTextStyles.styles.latoW700S20),
          ],
        ),
      ],
    );
  }
}
