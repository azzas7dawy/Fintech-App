import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/theme/app_colors.dart';

import 'package:fintech_app/features/payment/presentation/widgets/amount_card.dart';
import 'package:fintech_app/features/payment/presentation/widgets/fee_row.dart';
import 'package:fintech_app/features/payment/presentation/widgets/primery_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';

class BuyCryptoPage extends StatelessWidget {
  const BuyCryptoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(223, 247, 244, 244),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Icon(Icons.arrow_back_ios, color: AppColors.primaryDark),
            SizedBox(width: 50.w),
            Text(
              "buy_crypto".tr(),
              style: TextStyle(color: AppColors.primaryDark),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: ListView(
                  children: const [
                    SizedBox(height: 20),
                    AmountCard(),
                    SizedBox(height: 16),
                    FeeRow(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: PrimaryButton(
                text: "continue".tr(),

                onPressed: () => context.go('/paymentMethodScreen'),

                //  Navigator.of(context).push(
                //   MaterialPageRoute(builder: (_) => const PaymentMethodPage()),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
