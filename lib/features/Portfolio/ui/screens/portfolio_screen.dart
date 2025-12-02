import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/translation_keys.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/item_my_hold_model.dart';
import '../../data/models/recent_transaction_model.dart';
import '../widgets/item_my_hold.dart';
import '../widgets/item_recent_transaction.dart';
import '../widgets/portfolio_pie_chart.dart';
import '../widgets/portfolio_summary_card.dart';
import '../widgets/portfolio_tab_bar.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
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
              SizedBox(height: 25.h),
              Text(
                TranslationKeys.myHoldings.tr(),
                style: AppTextStyles.styles.latoW700S18.copyWith(
                  color: context.mainText,
                ),
              ),
              SizedBox(height: 20.h),
              ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10.h);
                },
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const ItemMyHold(model: ItemMyHoldModel());
                },
              ),
              SizedBox(height: 25.h),
              Text(
                TranslationKeys.recentTransactions.tr(),
                style: AppTextStyles.styles.latoW700S18.copyWith(
                  color: context.mainText,
                ),
              ),
              SizedBox(height: 10.h),
              ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10.h);
                },
                itemCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const ItemRecentTransaction(
                      model: RecentTransactionModel(
                        transactionType: 'Buy',
                        cryptocurrencyName: 'Bitcoin',
                        timestamp: '2 hours ago',
                        cryptoAmount: '0.01 BTC',
                        fiatAmount: '-\$452.50',
                      ),
                    );
                  } else {
                    return const ItemRecentTransaction(
                      model: RecentTransactionModel(
                        transactionType: 'Sell',
                        cryptocurrencyName: 'Ethereum',
                        timestamp: '1 day ago',
                        cryptoAmount: '0.5 ETH',
                        fiatAmount: '+\$1,050.25',
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
