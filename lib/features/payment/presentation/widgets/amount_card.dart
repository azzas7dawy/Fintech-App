import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fintech_app/features/payment/presentation/cubits/payment_cubit.dart';
import 'package:fintech_app/features/payment/presentation/cubits/payment_statue.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AmountCard extends StatelessWidget {
  const AmountCard({super.key});

  @override
  Widget build(BuildContext context) {
    // pick card bg depending on theme (so works light/dark)
    final theme = Theme.of(context);


    final innerBg = theme.brightness == Brightness.dark
        ? AppColors
              .containerDark // dark card color similar to screenshot
        : AppColors.containerLight;

    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        return Container(
          // use Container to get custom shadow + radius similar to design
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.containerLight,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
       
              BoxShadow(
                color: Colors.white.withValues(
                  alpha: theme.brightness == Brightness.dark ? 0.35 : 0.06,
                ),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // "You Pay" label (no toggle)
               Text(
                 "you_pay".tr(),
                style: TextStyle(color: AppColors.textDisabled, fontSize: 13.sp),
              ),
               SizedBox(height: 6.h),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '\$${state.amountPay.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 22.sp,
                        color: theme.brightness == Brightness.dark
                            ? AppColors.primaryDark
                            : AppColors.containerDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // currency pill
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.containerLight,
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: Row(
                      children: [
                         Icon(
                          Icons.attach_money,
                          size: 18.sp,
                          color: Colors.orangeAccent,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          state.payCurrency,
                          style: TextStyle(
                            color: theme.brightness == Brightness.dark
                                ? AppColors.primaryDark
                                : Colors.black87,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          size: 18,
                          color: AppColors.primaryDark,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),
              // thin divider as in design
              Divider(
                color: theme.brightness == Brightness.dark
                    ? Colors.white10
                    : Colors.grey.shade300,
                height: 1,
              ),
              const SizedBox(height: 12),

              // You Receive label (no toggle)
               Text(
                 "you_receive".tr(),
                style: TextStyle(color: Colors.grey, fontSize: 13.sp),
              ),
               SizedBox(height: 6.h),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      state.receiveAmount.toStringAsFixed(4),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.containerLight,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        // small crypto icon placeholder (replace with asset if available)
                        Container(
                          width: 26,
                          height: 26,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.backgroundDark,
                          ),
                          child: Center(
                            child: Text(
                              state.receiveCurrency[0],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                         SizedBox(width: 8.w),
                        Text(
                          state.receiveCurrency,
                          style: const TextStyle(color: AppColors.primaryDark),
                        ),
                         SizedBox(width: 4.w),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          size: 18,
                          color: AppColors.primaryDark,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),
              Row(
                children: [
                  const SizedBox(width: 50),
                  const Icon(Icons.circle, size: 8, color: Colors.orange),
                  const SizedBox(width: 8),
                  Text(
                    '1 USD = 0.00078 ETH',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
