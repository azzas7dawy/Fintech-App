import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'crypto_name_column.dart';
import 'crypto_price_column.dart';

class CardCryptoMarket extends StatelessWidget {
  const CardCryptoMarket({
    super.key,
    required this.name,
    required this.rank,
    required this.price,
    required this.percentage,
    required this.imageUrl,
  });
  final String name;
  final String rank;
  final String price;
  final String percentage;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.cardBackground,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.r),
        side: BorderSide(
          color: context.cardBackground,
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
                color: context.containerBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
              ),
              child: Image.asset(imageUrl),
              //  CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
            ),
            SizedBox(width: 16.0.w),
            CryptoNameColumn(name: name, symbol: rank),
            const Spacer(),
            CryptoPriceColumn(
              price: price,
              percentage: percentage,
            ),
          ],
        ),
      ),
    );
  }
}
