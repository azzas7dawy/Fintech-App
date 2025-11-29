import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';

class StaticsItem extends StatelessWidget {
  const StaticsItem({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.styles.latoW400S12.copyWith(
            color: context.primaryText,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.info_rounded, size: 12.sp, color: context.infoColor),
        ),
        const Spacer(),
        Text(
          value,
          style: AppTextStyles.styles.latoW500S14.copyWith(
            color: context.primaryText,
          ),
        ),
      ],
    );
  }
}
