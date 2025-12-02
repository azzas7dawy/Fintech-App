import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';

class LegendItem extends StatelessWidget {
  const LegendItem({
    super.key,
    required this.color,
    required this.amount,
    required this.coin,
  });
  final Color color;
  final String amount;
  final String coin;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 14.w,
          height: 14.h,
          decoration: ShapeDecoration(color: color, shape: const OvalBorder()),
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: Text(
            '$amount $coin',
            style: AppTextStyles.styles.latoW700S15.copyWith(
              color: context.mainText,
            ),
          ),
        ),
      ],
    );
  }
}
