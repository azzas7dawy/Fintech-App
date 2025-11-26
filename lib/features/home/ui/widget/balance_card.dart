import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // -------------------- MAIN CARD --------------------
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: const Color(0xFF1D3A70),
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: const [

            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                tr('home.balance.current'),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white.withOpacity(0.85),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),

              Text(
                '\$143,421.20',
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 16.h),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? Colors.black.withOpacity(0.3)
                      : const Color(0xFF10B981).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      tr('home.balance.weekly_profit'),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '2.35%',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: context.isDarkMode
                            ? Colors.white
                            : const Color(0xFF10B981),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // -------------------- TOP RIGHT (1/3 VISIBLE) --------------------
        Positioned(
          top: -90.h,
          right: -90.w,
          child: nestedCircles(
            big: 200.w,
            mid: 150.w,
            small: 100.w,
          ),
        ),

        // -------------------- BOTTOM LEFT (2/3 VISIBLE) --------------------
        Positioned(
          bottom: -80.h,
          left: -80.w,
          child: nestedCircles(
            big: 200.w,
            mid: 150.w,
            small: 100.w,
          ),
        ),
      ],
    );
  }

  // -------------------- NESTED CIRCLES WIDGET --------------------
  Widget nestedCircles({
    required double big,
    required double mid,
    required double small,
  }) {
    return SizedBox(
      width: big,
      height: big,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Big circle
          Container(
            width: big,
            height: big,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.05),
            ),
          ),

          // Mid circle
          Container(
            width: mid,
            height: mid,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.08),
            ),
          ),

          // Small circle
          Container(
            width: small,
            height: small,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.12),
            ),
          ),
        ],
      ),
    );
  }
}
