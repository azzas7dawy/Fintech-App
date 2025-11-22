import 'package:fintech_app/core/theme/icon_for_toggle_mode.dart';
import 'package:fintech_app/features/market/ui/widgets/coin_details_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinsDetailsScreen extends StatelessWidget {
  const CoinsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coins Details'),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: IconForToggleMode(),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: const Column(children: [CoinDetailsHeader()]),
        ),
      ),
    );
  }
}
