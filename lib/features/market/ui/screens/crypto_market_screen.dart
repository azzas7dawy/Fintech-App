import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/features/market/data/datasources/local/categories_static.dart';
import 'package:fintech_app/features/market/data/models/category_model/category_model/category_model.dart';
import 'package:fintech_app/features/market/ui/cubits/coins_cubit/crypto_market_cubit.dart';
import 'package:fintech_app/features/market/ui/widgets/build_coins_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/translation_keys.dart';
import '../widgets/crypto_market_tabbar.dart';
import '../widgets/search_text_field.dart';


class CryptoMarketScreen extends StatefulWidget {
  const CryptoMarketScreen({super.key});

  @override
  State<CryptoMarketScreen> createState() => _CryptoMarketScreenState();
}

class _CryptoMarketScreenState extends State<CryptoMarketScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  late final List<CategoryModel> _categories;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _categories = StaticCategories.list;

    _tabController = TabController(
      length: _categories.length,
      vsync: this,
    );

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;

      final category = _categories[_tabController.index];
      _loadForCategory(category);
    });

    _scrollController.addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadForCategory(_categories.first);
    });
  }

  void _loadForCategory(CategoryModel category) {
    final id = category.categoryId;
    context.read<CryptoMarketCubit>().getCryptoMarketData(
          categoryId: id == 'all' ? null : id,
        );
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    const threshold = 300.0;

    if (_scrollController.position.extentAfter < threshold) {
      context.read<CryptoMarketCubit>().loadMoreCryptoMarkets();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  // ------------------ UI ---------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              SizedBox(height: 16.h),
              const SearchTextField(),
              SizedBox(height: 16.h),

              Expanded(
                child: Column(
                  children: [
                    CryptoMarketTabBar(
                      categories: _categories,
                      controller: _tabController,
                    ),
                    SizedBox(height: 16.h),
                    Expanded(
                      child: CryptoMarketCoinsList(
                        scrollController: _scrollController,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Text(
      TranslationKeys.cryptoMarket.tr(),
      style: AppTextStyles.styles.latoW700S24.copyWith(
        color: context.mainText,
      ),
    );
  }
}
