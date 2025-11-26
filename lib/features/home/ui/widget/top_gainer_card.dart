import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopGainerCard extends StatelessWidget {
  final String name;
  final String symbol;
  final String price;
  final String percentage;
  final String image;

  const TopGainerCard({
    Key? key,
    required this.name,
    required this.symbol,
    required this.price,
    required this.percentage, required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.cardBackground,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.cardBorderColor),
        boxShadow: context.cardShadow,
      ),
      child: Row(
        children: [
        Container(
        width: 48.w,
        height: 48.h,
        decoration: BoxDecoration(
          color: const Color(0xFF2B5BF5)
              .withOpacity(context.isDarkMode ? 0.25 : 0.1),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Center(
          child: Image.asset(
            image,  // 🟦 غيّرها للصورة بتاعتك
            width: 50.w,
            height: 30.h,
            fit: BoxFit.cover,
          ),
        ),
      ),
        SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: context.primaryText,
                  ),
                ),
                Text(
                  symbol,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: context.secondaryText,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: context.primaryText,
                ),
              ),
              Text(
                percentage,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF10B981),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}