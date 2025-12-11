import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/translation_keys.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/recent_transaction_model.dart';
import '../cubits/portfolio_cubit.dart';
import '../cubits/portfolio_state.dart';
import '../widgets/item_my_hold.dart';
import '../widgets/item_recent_transaction.dart';
import '../widgets/portfolio_pie_chart.dart';
import '../widgets/portfolio_summary_card.dart';
import '../widgets/portfolio_tab_bar.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PortfolioCubit>().getPortfolioData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<PortfolioCubit, PortfolioState>(
        builder: (context, state) {
          return SingleChildScrollView(
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
                  _buildSummaryCard(state),
                  SizedBox(height: 25.h),
                  const DefaultTabController(
                    length: 6,
                    child: PortfolioTabBar(),
                  ),
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
                  _buildHoldingsList(state),
                  SizedBox(height: 25.h),
                  Text(
                    TranslationKeys.recentTransactions.tr(),
                    style: AppTextStyles.styles.latoW700S18.copyWith(
                      color: context.mainText,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  _buildTransactionsList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSummaryCard(PortfolioState state) {
    if (state is PortfolioSuccess) {
      return PortfolioSummaryCard(
        totalValue: state.totalValue,
        changePercentage: state.total24hChange,
        changeAmount: state.total24hChangeAmount,
      );
    } else if (state is PortfolioLoading) {
      return const PortfolioSummaryCard(
        totalValue: 0,
        changePercentage: 0,
        changeAmount: 0,
        isLoading: true,
      );
    } else if (state is PortfolioError) {
      return const PortfolioSummaryCard(
        totalValue: 0,
        changePercentage: 0,
        changeAmount: 0,
      );
    }
    return const PortfolioSummaryCard(
      totalValue: 0,
      changePercentage: 0,
      changeAmount: 0,
    );
  }

  Widget _buildHoldingsList(PortfolioState state) {
    if (state is PortfolioLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state is PortfolioSuccess) {
      return ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(height: 10.h);
        },
        itemCount: state.holdings.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ItemMyHold(model: state.holdings[index]);
        },
      );
    } else if (state is PortfolioError) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(20.0.r),
          child: Text(
            'Error loading portfolio: ${state.message}',
            style: AppTextStyles.styles.latoW400S14.copyWith(
              color: context.mainText,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildTransactionsList() {
    return ListView.separated(
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
    );
  }
}
