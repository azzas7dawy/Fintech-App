import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class CryptoNameColumn extends StatelessWidget {
  const CryptoNameColumn({
    super.key,
    required this.isDark,
    required this.name,
    required this.symbol,
  });

  final bool isDark;
  final String name;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: AppTextStyles.styles.latoW700S20.copyWith(
            color: isDark ? AppColors.successLight : AppColors.successDark,
          ),
        ),
        SizedBox(height: 4.0.h),
        Text(
          symbol,
          style: AppTextStyles.styles.latoW400S16.copyWith(
            color: AppColors.textDisabled,
          ),
        ),
      ],
    );
  }
}
