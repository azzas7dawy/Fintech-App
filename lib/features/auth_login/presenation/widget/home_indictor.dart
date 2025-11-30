import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeIndicator extends StatelessWidget {
  final Color color;

  const HomeIndicator({
    super.key,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 120.w,
        height: 5.h,
        decoration: BoxDecoration(
          color: color.withOpacity(0.9),
          borderRadius: BorderRadius.circular(3.r),
        ),
      ),
    );
  }
}