import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/features/payment/presentation/cubits/payment_cubit.dart';
import 'package:fintech_app/features/payment/presentation/cubits/payment_statue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeeRow extends StatelessWidget {
  const FeeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: Card(
                color: AppColors.containerLight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.orangColor.withOpacity(0.07),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Image(
                          image: AssetImage('assets/images/Rectangle897.png'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text('Exchange fee',style:
                          AppTextStyles.styles.latoW500S12.copyWith(
                            color: AppColors.gray,
                          ),
                           ),
                          Text('${state.feePercent}%',
                          style: AppTextStyles.styles.latoW600S16.copyWith(
                            color: AppColors.mainColor,
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 96,
              height: 84,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child:  Center(
                child: Text(
                  '\$26',
                  style: AppTextStyles.styles.latoW600S15.copyWith(
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
} 