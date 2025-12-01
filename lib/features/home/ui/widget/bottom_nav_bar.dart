import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/assets.dart';
import '../../../../core/routing/routes.dart';
import 'bottom_nav_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  int _getSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    if (location == Routes.homePage) return 0;
    if (location.startsWith(Routes.cryptoMarket)) return 1;
    if (location.startsWith(Routes.portfolioScreen) ||
        location.startsWith(Routes.paymentMethodScreen))
      return 2;
    if (location.startsWith(Routes.settings)) return 3;

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final index = _getSelectedIndex(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: context.cardBackground,
        border: Border(top: BorderSide(color: context.cardBorderColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavItem(
            image: Assets.iconsHome,
            label: tr('home.nav.home'),
            isSelected: index == 0,
            onTap: () => context.go(Routes.homePage),
          ),
          BottomNavItem(
            image: Assets.iconsChart,
            label: tr('home.nav.market'),
            isSelected: index == 1,
            onTap: () => context.go(Routes.cryptoMarket),
          ),
          BottomNavItem(
            image: Assets.iconsBriefcase,
            label: tr('home.nav.portfolio'),
            isSelected: index == 2,
            onTap: () => context.go(Routes.portfolioScreen),
          ),
          BottomNavItem(
            image: Assets.iconsSetting,
            label: tr('home.nav.settings'),
            isSelected: index == 3,
            onTap: () => context.go(Routes.settings),
          ),
        ],
      ),
    );
  }
}
