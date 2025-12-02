import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/translation_keys.dart';
import 'portfolio_selected_tab_bar.dart';
import 'portfolio_unselected_tab_bar.dart';

class PortfolioTabBar extends StatelessWidget {
  const PortfolioTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = DefaultTabController.of(context);
    final tabLabels = [
      TranslationKeys.nov.tr(),
      TranslationKeys.dec.tr(),
      TranslationKeys.jan.tr(),
      TranslationKeys.feb.tr(),
      TranslationKeys.mar.tr(),
      TranslationKeys.apr.tr(),
    ];
    return AnimatedBuilder(
      animation: tabController.animation!,
      builder: (context, child) {
        return TabBar(
          controller: tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          dividerColor: Colors.transparent,
          padding: EdgeInsets.zero,
          labelPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
          indicator: const BoxDecoration(color: Colors.transparent),
          tabs: List.generate(tabLabels.length, (index) {
            final isSelected = tabController.index == index;
            return isSelected
                ? PortfolioSelectedTabBar(label: tabLabels[index])
                : PortfolioUnselectedTabBar(label: tabLabels[index]);
          }),
        );
      },
    );
  }
}
