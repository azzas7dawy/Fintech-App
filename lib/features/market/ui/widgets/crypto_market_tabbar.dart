import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/features/market/data/models/category_model/category_model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'selected_tab.dart';
import 'unselected_tab.dart';

class CryptoMarketTabBar extends StatelessWidget {
  final List<CategoryModel> categories;
  final TabController controller;

  const CryptoMarketTabBar({
    super.key,
    required this.categories,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final tabLabels = categories
        .map((c) => c.name ?? 'Category')
        .toList();

    return AnimatedBuilder(
      animation: controller.animation!,
      builder: (context, child) {
        return TabBar(
          controller: controller,
          isScrollable: true,
          indicatorColor: context.mainText,
          labelColor: context.mainText,
          unselectedLabelColor: AppColors.neutral300,
          labelStyle: AppTextStyles.styles.latoW600S16,
          dividerColor: Colors.transparent,
          labelPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
          indicator: const BoxDecoration(color: Colors.transparent),
          unselectedLabelStyle: AppTextStyles.styles.latoW400S16,
          tabs: List.generate(
            tabLabels.length,
            (index) {
              final isSelected = controller.index == index;
              final label = tabLabels[index];

              return isSelected
                  ? SelectedTab(label: label)
                  : UnSelectedTab(label: label);
            },
          ),
        );
      },
    );
  }
}
