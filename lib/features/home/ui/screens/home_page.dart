import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/app_bar_section.dart';
import '../widget/balance_card.dart';
import '../widget/bottom_nav_bar.dart';
import '../widget/market_overview_section.dart';
import '../widget/top_gainers_section.dart';
import '../widget/trending_section.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    const AppBarSection(),
                    SizedBox(height: 24.h),
                    const BalanceCard(),
                    SizedBox(height: 24.h),
                    const MarketOverviewSection(),
                    SizedBox(height: 24.h),
                    const TrendingSection(),
                    SizedBox(height: 24.h),
                    const TopGainersSection(),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          //  const BottomNavBar(),
          ],
        ),
      ),
    );
  }
}