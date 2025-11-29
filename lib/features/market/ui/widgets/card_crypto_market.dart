import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'crypto_name_column.dart';
import 'crypto_price_column.dart';

class CardCryptoMarket extends StatelessWidget {
  const CardCryptoMarket({
    super.key,
    required this.isDark,
    required this.name,
    required this.rank,
    required this.price,
    required this.percentage,
    required this.imageUrl,
  });
  final bool isDark;
  final String name;
  final String rank;
  final String price;
  final String percentage;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDark ? AppColors.containerDark : AppColors.white,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.r),
        side: BorderSide(
          color: isDark ? AppColors.containerDark : AppColors.white,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.0.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 52.0.w,
              height: 52.0.h,
              padding: EdgeInsets.all(6.0.r),

              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: isDark
                    ? AppColors.cardBackgroundDark
                    : AppColors.cardBackgroundLight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
              ),
              child: Image.asset(imageUrl),
              //  CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
            ),
            SizedBox(width: 16.0.w),
            CryptoNameColumn(isDark: isDark, name: name, symbol: rank),
            const Spacer(),
            CryptoPriceColumn(
              isDark: isDark,
              price: price,
              percentage: percentage,
            ),
          ],
        ),
      ),
    );
  }
}
