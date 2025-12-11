// import 'package:easy_localization/easy_localization.dart';
// import 'package:fintech_app/core/extensions/theme_extension.dart';
// import 'package:fintech_app/features/home/ui/widget/trending_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../core/constant/assets.dart';

// class TrendingSection extends StatelessWidget {
//   const TrendingSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               tr('home.trending.title'),
//               style: TextStyle(
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.bold,
//                 color: context.mainText,
//               ),
//             ),
//             TextButton(
//               onPressed: () {},
//               child: Text(
//                 tr('home.trending.view_all'),
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   color: const Color(0xFF2B5BF5),
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 16.h),
//         SizedBox(
//           height: 150.h,
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             children: const [
//               TrendingCard(
//                 name: 'Bitcoin',
//                 symbol: 'BTC',
//                 price: '1,132,151',
//                 percentage: '+2.35%',
//                 isPositive: true,
//                 image: Assets.imagesBitcoin,
//               ),
//               TrendingCard(
//                 name: 'Ethereum',
//                 symbol: 'ETH',
//                 price: '20,788',
//                 percentage: '+1.85%',
//                 isPositive: true,
//                 image: Assets.imagesEthereum,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/features/home/ui/cubits/home_cubit.dart';

import 'package:fintech_app/features/home/ui/widget/trending_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/assets.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tr('home.trending.title'),
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: context.mainText,
              ),
            ),
            TextButton(
              onPressed: () {
                // context.read<HomeCubit>().getTrending();
              },
              child: Text(
                tr('home.trending.view_all'),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF2B5BF5),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 150.h,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                // simple skeleton placeholders
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: 3,
                  separatorBuilder: (_, __) => SizedBox(width: 12.w),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200.w,
                      margin: EdgeInsets.only(right: 8.w),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    );
                  },
                );
              } else if (state is HomeLoaded) {
                final trending = state.trending as List; // expecting List<TrendingCoin>
                if (trending.isEmpty) {
                  return Center(child: Text('No trending coins'.tr()));
                }

                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: trending.length,
                  separatorBuilder: (_, __) => SizedBox(width: 12.w),
                  itemBuilder: (context, index) {
                    final item = trending[index];
                    
                    final coin = item.item;
                    final name = coin?.name ?? '-';
                    final symbol = coin?.symbol ?? '-';
                    
                    // price not present in trending item by default; you may map to price if exists
                    final price = coin?.price_btc != null
                        ? coin!.price_btc!.toString()
                        : '-';
                    final image = coin?.thumb ?? Assets.imagesBitcoin; // fallback
                    // trending doesn't include percentage; leave blank or calculate if available
                    return TrendingCard(
                      name: name,
                      symbol: symbol,
                      price: price,
                      percentage: '3.25%', // no percentage in trending endpoint by default
                      isPositive: true,
                      image: image,
                    );
                  },
                );
              } else if (state is HomeError) {
                return Center(child: Text(state.message));
              } else {
   
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }
}
