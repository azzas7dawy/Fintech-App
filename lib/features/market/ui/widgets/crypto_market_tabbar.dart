import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/translation_keys.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'selected_tab.dart';
import 'unselected_tab.dart';

class CryptoMarketTabBar extends StatelessWidget {
  const CryptoMarketTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final tabLabels = [
      TranslationKeys.all,
      TranslationKeys.defi,
      TranslationKeys.nft,
      TranslationKeys.gaming,
      TranslationKeys.metaverse,
    ];

    final tabController = DefaultTabController.of(context);
    return AnimatedBuilder(
      animation: tabController.animation!,
      builder: (context, child) {
        return TabBar(
          isScrollable: true,
          indicatorColor: context.mainText,
          labelColor: context.mainText,
          unselectedLabelColor: AppColors.neutral300,
          labelStyle: AppTextStyles.styles.latoW600S16,
          tabAlignment: TabAlignment.start,
          dividerColor: Colors.transparent,
          padding: EdgeInsets.zero,
          labelPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
          indicator: const BoxDecoration(color: Colors.transparent),
          unselectedLabelStyle: AppTextStyles.styles.latoW400S16,
          tabs: List.generate(tabLabels.length, (index) {
            final isSelected = tabController.index == index;
            return isSelected
                ? SelectedTab(label: tabLabels[index])
                : UnSelectedTab(label: tabLabels[index]);
          }),
        );
      },
    );
  }
}
