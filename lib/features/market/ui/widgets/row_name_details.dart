import 'package:cached_network_image/cached_network_image.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class RowNameDetails extends StatelessWidget {
  const RowNameDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundColor: isDark ? AppColors.containerDark : AppColors.white,
          child: CachedNetworkImage(
            imageUrl:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/96px-Bitcoin.svg.png?20140331024207',
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: 30.w,
            height: 30.h,
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          'Bitcoin',
          style: AppTextStyles.styles.latoW700S24.copyWith(
            color: isDark ? AppColors.white : AppColors.primaryDark,
          ),
        ),
      ],
    );
  }
}
