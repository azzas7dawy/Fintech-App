import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendingCard extends StatelessWidget {
  final String name;
  final String symbol;
  final String price;
  final String percentage;
  final String image;
  final bool isPositive;

  const TrendingCard({
    Key? key,
    required this.name,
    required this.symbol,
    required this.price,
    required this.percentage,
    required this.isPositive,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      margin: EdgeInsets.only(right: 12.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.cardBackground,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.cardBorderColor),
        boxShadow: context.cardShadow,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text(
              name,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w900,
                color: context.primaryText,
              ),
            ),
            subtitle: Text(
              symbol,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                color: context.primaryText,
              ),
            ),
            trailing: Image.asset(
              image,
              width: 50.w,
              height: 50.h,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Text(
                price,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: context.primaryText,
                ),
              ),
              const Spacer(),
              Text(
                percentage,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: isPositive
                      ? const Color(0xFF10B981)
                      : const Color(0xFFEF4444),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
