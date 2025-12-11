import 'package:fintech_app/features/market/data/models/category_model/category_model/category_model.dart';

class StaticCategories {
  static const List<CategoryModel> list = [
    CategoryModel(
      categoryId: 'all',
      name: 'All',
    ),
    CategoryModel(
      categoryId: 'decentralized-finance-defi',
      name: 'DeFi',
    ),
    CategoryModel(
      categoryId: 'non-fungible-tokens-nft',
      name: 'NFT',
    ),
    CategoryModel(
      categoryId: 'gaming',
      name: 'Gaming',
    ),
    CategoryModel(
      categoryId: 'metaverse',
      name: 'Metaverse',
    ),
    CategoryModel(
      categoryId: 'art',
      name: 'Art',
    ),
    // CategoryModel(
    //   categoryId: 'collectibles',
    //   name: 'Collectibles',
    // ),
  ];
}
