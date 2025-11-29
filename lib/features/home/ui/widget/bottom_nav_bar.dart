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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: context.cardBackground,
        border: Border(top: BorderSide(color: context.cardBorderColor)),
        boxShadow: context.isDarkMode
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavItem(
            image: Assets.iconsHome,
            label: tr('home.nav.home'),
            isSelected: true,
            onTap: () {},
          ),
          BottomNavItem(
            image: Assets.iconsChart,
            label: tr('home.nav.market'),
            isSelected: false,
            onTap: () {
              context.push(Routes.cryptoMarket);
            },
          ),
          BottomNavItem(
            image: Assets.iconsBriefcase,
            label: tr('home.nav.portfolio'),
            isSelected: false,
            onTap: () {},
          ),
          BottomNavItem(
            image: Assets.iconsSetting,
            label: tr('home.nav.settings'),
            isSelected: false,
            onTap: () {
              context.push(Routes.settings);
            },
          ),
        ],
      ),
    );
  }
}
