import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/assets.dart';

class TopGainerCard extends StatelessWidget {
  final String name;
  final String symbol;
  final String price;
  final String percentage;
  final String? image; // nullable because sometimes missing

  const TopGainerCard({
    super.key,
    required this.name,
    required this.symbol,
    required this.price,
    required this.percentage,
    required this.image,
  });

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
          // image container - fixed square to avoid overflow
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: context.containerBackground,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: _buildImage(image),
            ),
          ),
          SizedBox(width: 12.w),

          // name & symbol - take remaining space and ellipsize
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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  symbol.toUpperCase(),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: context.secondaryText,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          SizedBox(width: 12.w),

          // price & percentage - constrained so it doesn't take all space
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 80.w, maxWidth: 120.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: context.primaryText,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  percentage,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: percentage.startsWith('-') ? const Color(0xFFEF4444) : const Color(0xFF10B981),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String? src) {
    final double size = 48.w;

    if (src == null || src.isEmpty) {
      return _localPlaceholder(size);
    }

    final bool isNetwork = src.startsWith('http') || src.startsWith('https');

    if (!isNetwork) {
      // treat as local asset path
      return Image.asset(
        src,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (c, e, st) => _localPlaceholder(size),
      );
    }

    // network image with fallback and loading indicator
    return Image.network(
      src,
      width: size,
      height: size,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          width: size,
          height: size,
          alignment: Alignment.center,
          child: SizedBox(
            width: 18.w,
            height: 18.w,
            child: CircularProgressIndicator(strokeWidth: 2.w),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return _localPlaceholder(size);
      },
    );
  }

  Widget _localPlaceholder(double size) {
    return Container(
      width: size,
      height: size,
      color: Colors.grey.shade200,
      child: Center(
        child: Image.asset(
          Assets.imagesBitcoin,
          width: size * 0.6,
          height: size * 0.6,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
