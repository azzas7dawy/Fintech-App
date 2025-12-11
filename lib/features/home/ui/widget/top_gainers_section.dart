// import 'package:easy_localization/easy_localization.dart';
// import 'package:fintech_app/core/extensions/theme_extension.dart';
// import 'package:fintech_app/features/home/ui/widget/top_gainer_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../core/constant/assets.dart';

// class TopGainersSection extends StatelessWidget {
//   const TopGainersSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           tr('home.top_gainers.title'),
//           style: TextStyle(
//             fontSize: 18.sp,
//             fontWeight: FontWeight.bold,
//             color: context.mainText,
//           ),
//         ),

//         SizedBox(height: 16.h),
//         const TopGainerCard(
//           name: 'Ethereum',
//           symbol: 'ETH',
//           price: '\$20,788',
//           percentage: '+0.25%',
//           image: Assets.imagesEthereum,
//         ),
//         SizedBox(height: 12.h),
//         const TopGainerCard(
//           name: 'Binance Coin',
//           symbol: 'BNB',
//           price: '\$312.45',
//           percentage: '+1.15%',
//           image: Assets.imagesBinanceCoin,
//         ),
//         SizedBox(height: 12.h),
//         const TopGainerCard(
//           name: 'Litecoin',
//           symbol: 'LTC',
//           price: '\$94.32',
//           percentage: '+0.85%',
//           image: Assets.imagesGroup48095472,
//         ),
//       ],
//     );
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/features/home/ui/cubits/home_cubit.dart';

import 'package:fintech_app/features/home/ui/widget/top_gainer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/assets.dart';

class TopGainersSection extends StatelessWidget {
  const TopGainersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        Widget content;

        if (state is HomeLoading) {
          // show placeholders
          content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(3, (index) {
              return Column(
                children: [
                  Container(
                    height: 64.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  SizedBox(height: 12.h),
                ],
              );
            }),
          );
        } else if (state is HomeLoaded) {
          final gainers = state.gainers as List; // expecting List<GainerItem>
          if (gainers.isEmpty) {
            content = Center(child: Text('No gainers'.tr()));
          } else {
            content = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr('home.top_gainers.title'),
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: context.mainText,
                  ),
                ),
                SizedBox(height: 16.h),
                ...gainers.map((g) {
                  final gainer = g as dynamic; // GainerItem
                  final name = gainer.name ?? '-';
                  final symbol = gainer.symbol ?? '-';
                  final price = gainer.usdPrice != null ? '\$${gainer.usdPrice.toString()}' : '-';
                  final change = gainer.usd24hChange != null ? (gainer.usd24hChange >= 0 ? '+${gainer.usd24hChange.toStringAsFixed(2)}%' : '${gainer.usd24hChange.toStringAsFixed(2)}%') : '';
                  final image = gainer.image ?? Assets.imagesEthereum;

                  return Column(
                    children: [
                      TopGainerCard(
                        name: name,
                        symbol: symbol,
                        price: price,
                        percentage: change,
                        image: image,
                      ),
                      SizedBox(height: 12.h),
                    ],
                  );
                }).toList(),
              ],
            );
          }
        } else if (state is HomeError) {
          content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tr('home.top_gainers.title'),
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: context.mainText,
                ),
              ),
              SizedBox(height: 16.h),
              Center(child: Text(state.message))
              
            ],
          );
        } else {
          content = const SizedBox.shrink();
        }

        return content;
      },
    );
  }
}
