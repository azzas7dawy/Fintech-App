import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/translation_keys.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class StaticsDetails extends StatelessWidget {
  const StaticsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TranslationKeys.statics.tr(),
          style: AppTextStyles.styles.latoW600S18.copyWith(
            color: isDark ? AppColors.white : AppColors.darkBlue,
          ),
        ),
        StaticsItem(
          title: TranslationKeys.currentPrice.tr(),
          value: '44.826,12 \$',
        ),
        const DividerStatics(),
        StaticsItem(title: TranslationKeys.marketCap.tr(), value: '836,819 \$'),
        const DividerStatics(),
        StaticsItem(title: TranslationKeys.volume24h.tr(), value: '35,867 \$'),
        const DividerStatics(),
        StaticsItem(
          title: TranslationKeys.availableSupply.tr(),
          value: '18,784',
        ),
        const DividerStatics(),
        StaticsItem(title: TranslationKeys.maxSupply.tr(), value: '21,000'),
      ],
    );
  }
}

class DividerStatics extends StatelessWidget {
  const DividerStatics({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Divider(
      color: isDark
          ? AppColors.dividerColorDarkMode
          : AppColors.dividerColorLightMode,
      height: 1,
    );
  }
}

class StaticsItem extends StatelessWidget {
  const StaticsItem({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.styles.latoW400S12.copyWith(
            color: isDark ? AppColors.white : AppColors.darkBlue,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.info_rounded,
            size: 12.sp,
            color: isDark
                ? AppColors.infoColorDarkMode
                : AppColors.infoColorLightMode,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: AppTextStyles.styles.latoW500S14.copyWith(
            color: isDark ? AppColors.white : AppColors.darkBlue,
          ),
        ),
      ],
    );
  }
}
