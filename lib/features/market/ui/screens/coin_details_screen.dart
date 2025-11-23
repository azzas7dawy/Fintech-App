import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/translation_keys.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class CoinDetailsScreen extends StatelessWidget {
  const CoinDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: AppTextStyles.styles.latoW700S24.copyWith(
          color: isDark ? AppColors.white : AppColors.mainColor,
        ),
        title: Text(TranslationKeys.coinDetails.tr()),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: isDark ? AppColors.white : AppColors.mainColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            RowNameDetails(isDark: isDark),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}

class RowNameDetails extends StatelessWidget {
  const RowNameDetails({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundColor: isDark
              ? AppColors.darkModeContainerColor
              : AppColors.white,
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
            color: isDark ? AppColors.white : AppColors.mainColor,
          ),
        ),
      ],
    );
  }
}
