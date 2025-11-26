import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottom_nav_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

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
            icon: Icons.home_rounded,
            label: tr('home.nav.home'),
            isSelected: true,
            onTap: () {},
          ),
          BottomNavItem(
            icon: Icons.bar_chart_rounded,
            label: tr('home.nav.market'),
            isSelected: false,
            onTap: () {},
          ),
          BottomNavItem(
            icon: Icons.pie_chart_rounded,
            label: tr('home.nav.portfolio'),
            isSelected: false,
            onTap: () {},
          ),
          BottomNavItem(
            icon: Icons.settings_rounded,
            label: tr('home.nav.settings'),
            isSelected: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}