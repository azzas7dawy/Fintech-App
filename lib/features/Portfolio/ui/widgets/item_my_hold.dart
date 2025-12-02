import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/item_my_hold_model.dart';

class ItemMyHold extends StatelessWidget {
  const ItemMyHold({super.key, required this.model});

  final ItemMyHoldModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 21.h),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: context.cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Row(
        children: [
          // Left Section - Coin Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: context.containerBackground,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Image.asset(
                        model.imageUrl,
                        width: 36.w,
                        height: 36.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: 12.0.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.coinName,
                          style: AppTextStyles.styles.latoW700S16.copyWith(
                            color: context.mainText,
                          ),
                        ),
                        SizedBox(height: 2.0.h),
                        Text(
                          model.coinSymbol,
                          style: AppTextStyles.styles.latoW500S14.copyWith(
                            color: context.secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12.0.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 43.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.quantity,
                        style: AppTextStyles.styles.latoW600S16.copyWith(
                          color: context.mainText,
                        ),
                      ),
                      SizedBox(height: 4.0.h),
                      Text(
                        model.value,
                        style: AppTextStyles.styles.latoW600S16.copyWith(
                          color: AppColors.accent,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Right Section - Performance Metrics
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                model.allocation,
                style: AppTextStyles.styles.latoW700S18.copyWith(
                  color: context.mainText,
                ),
              ),
              SizedBox(height: 8.0.h),
              Text(
                model.gainAmount,
                style: AppTextStyles.styles.latoW600S16.copyWith(
                  color: context.textGreen,
                ),
              ),
              SizedBox(height: 4.0.h),
              Text(
                model.gainPercentage,
                style: AppTextStyles.styles.latoW600S16.copyWith(
                  color: context.textGreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
