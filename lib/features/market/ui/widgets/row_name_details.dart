import 'package:cached_network_image/cached_network_image.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';

class RowNameDetails extends StatelessWidget {
   RowNameDetails({super.key,required this.name,required this.symbol,required this.image});
 final  String name;
  final String symbol;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundColor: context.cardBackground,
          child: CachedNetworkImage(
            imageUrl:image,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: 30.w,
            height: 30.h,
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          '$name (' + symbol + ')',
          textAlign: TextAlign.start,
          style: AppTextStyles.styles.latoW700S24.copyWith(
            color: context.mainText,
          ),
        ),
      ],
    );
  }
}
