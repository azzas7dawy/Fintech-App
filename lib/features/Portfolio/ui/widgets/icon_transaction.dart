import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconTransaction extends StatelessWidget {
  const IconTransaction({
    super.key,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.isBuy,
  });

  final Color iconBackgroundColor;
  final Color iconColor;
  final bool isBuy;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        color: context.iconBackground,
        shape: BoxShape.circle,
      ),
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: iconBackgroundColor,
          shape: BoxShape.circle,
          border: Border.all(color: iconColor, width: 2.5),
        ),
        child: Icon(
          isBuy ? Icons.arrow_upward : Icons.arrow_downward,
          color: iconColor,
          size: 20.sp,
        ),
      ),
    );
  }
}
