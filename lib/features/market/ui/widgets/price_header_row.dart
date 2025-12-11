import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class PriceHeaderRow extends StatelessWidget {
  const PriceHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\$54,382.64',
              textAlign: TextAlign.center,
              style: AppTextStyles.styles.latoW700S32.copyWith(
                color: context.successText,
              ),
            ),
            Text(
              '/ 1 BTC',
              textAlign: TextAlign.center,
              style: AppTextStyles.styles.latoW700S14.copyWith(
                color: AppColors.textDisabled,
              ),
            ),
          ],
        ),

        Container(
          padding: EdgeInsets.all(8.r),
          decoration: ShapeDecoration(
            color: context.mainText,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Icon(Icons.call_made_outlined, color: context.cardBackground),
              Text(
                '15.3%',
                textAlign: TextAlign.center,
                style: AppTextStyles.styles.latoW700S12.copyWith(
                  color: context.cardBackground,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
