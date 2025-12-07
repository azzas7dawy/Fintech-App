import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class CryptoNameColumn extends StatelessWidget {
  const CryptoNameColumn({super.key, required this.name, required this.symbol});

  final String name;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          overflow: TextOverflow.ellipsis,
          name,
          style: AppTextStyles.styles.latoW700S17.copyWith(
            color: context.successText,
          ),
        ),
        SizedBox(height: 4.0.h),
        Text(
          symbol,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.styles.latoW400S16.copyWith(
            color: AppColors.textDisabled,
          ),
        ),
      ],
    );
  }
}
