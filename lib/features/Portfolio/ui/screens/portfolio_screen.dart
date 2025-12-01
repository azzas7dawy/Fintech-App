import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/translation_keys.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/portfolio_pie_chart.dart';
import '../widgets/portfolio_summary_card.dart';
import '../widgets/portfolio_tab_bar.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TranslationKeys.portfolio.tr(),
              style: AppTextStyles.styles.latoW700S24.copyWith(
                color: context.mainText,
              ),
            ),
            SizedBox(height: 30.h),
            const PortfolioSummaryCard(),
            SizedBox(height: 25.h),

            const DefaultTabController(length: 6, child: PortfolioTabBar()),
            SizedBox(height: 25.h),
            const PortfolioPieChart(),
          ],
        ),
      ),
    );
  }
}
