import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/features/home/ui/widget/market_overview_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/assets.dart';

class TrendingCard extends StatelessWidget {
  final String name;
  final String symbol;
  final String price;
  final String percentage;
  final bool isPositive;
  final String? image; // expect remote url or local asset fallback

  const TrendingCard({
    Key? key,
    required this.name,
    required this.symbol,
    required this.price,
    required this.percentage,
    required this.isPositive,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // card width - control this to avoid horizontal overflow in ListView
    final double cardWidth = 200.w;

    return Container(
      width: cardWidth,
      margin: EdgeInsets.only(right: 12.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
         color: context.cardBackground,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // name + symbol - take remaining space but not more
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // name - allow overflow with ellipsis
                      Text(
                        name,
                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        symbol,
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              
                SizedBox(width: 8.w),
            
                // trailing percentage - fixed width so it won't consume whole row
                ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 64.w, maxWidth: 80.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                         SizedBox(width: 12.w),
                 ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: _buildImage(image, size: 40.w),
                ),
               
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 18.h),
         
          // price row - ensure it fits and wraps if needed
          Row(
            children: [
              Expanded(
                child: Text(
                 price.toString(),
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
                    Row(
                     children: [
                       Text(
                         percentage,
                         style: TextStyle(
                           fontSize: 12.sp,
                           fontWeight: FontWeight.bold,
                           color: isPositive ? Colors.green : Colors.red,
                         ),
                       ),
                       Icon(
                         isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                         size: 16.sp,
                         color: isPositive ? Colors.green : Colors.red,
                       ),
                     ],
                   )
              // optional small indicator or badge
            ],
          ),
        ],
      ),
    );
  }

  // helper to build image either network or local asset fallback
  Widget _buildImage(String? src, {double size = 40}) {
    final double s = size;
    if (src == null || src.isEmpty) {
      return _localPlaceholder(s);
    }

    // If src looks like a network url use Image.network
    final bool isNetwork = src.startsWith('http') || src.startsWith('https');

    if (isNetwork) {
      return SizedBox(
        width: s,
        height: s,
        child: Image.network(
          src,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _localPlaceholder(s);
          },
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return Container(
              width: s,
              height: s,
              alignment: Alignment.center,
              child: CircularProgressIndicator(strokeWidth: 2.w),
            );
          },
        ),
      );
    } else {
      // treat as local asset path
      return SizedBox(
        width: s,
        height: s,
        child: Image.asset(
          src,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _localPlaceholder(s),
        ),
      );
    }
  }

  Widget _localPlaceholder(double s) {
    return Container(
      width: s,
      height: s,
      color: Colors.grey.shade200,
      child: Center(
        child: Image.asset(
          Assets.imagesBitcoin,
          width: s * 0.6,
          height: s * 0.6,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
