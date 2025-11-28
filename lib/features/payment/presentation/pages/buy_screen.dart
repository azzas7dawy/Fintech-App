import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/features/payment/presentation/cubits/payment_cubit.dart';

import 'package:fintech_app/features/payment/presentation/widgets/amount_card.dart';
import 'package:fintech_app/features/payment/presentation/widgets/fee_row.dart';
import 'package:fintech_app/features/payment/presentation/widgets/primery_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BuyCryptoPage extends StatelessWidget {
  const BuyCryptoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: const Color.fromARGB(223, 247, 244, 244),
      appBar: AppBar(
        backgroundColor: AppColors.darkLightGroundColor,
        title:const Row(
          children: [
            Icon(Icons.arrow_back_ios,color: AppColors.mainColor,),
            SizedBox(width: 50,),
             Text('Buy Crypto',
                   style: TextStyle(
             color: AppColors.mainColor
                   ),
                   ),
          ],
        )),
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: PrimaryButton(
                text: 'Continue',
        
                onPressed: () =>
                context.go('/paymentMethodScreen',
                ),

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
