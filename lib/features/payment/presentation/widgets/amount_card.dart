import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fintech_app/features/payment/presentation/cubits/payment_cubit.dart';
import 'package:fintech_app/features/payment/presentation/cubits/payment_statue.dart';

class AmountCard extends StatelessWidget {
  const AmountCard({super.key});

  @override
  Widget build(BuildContext context) {
    // pick card bg depending on theme (so works light/dark)
    final theme = Theme.of(context);
    final cardBg = theme.brightness == Brightness.dark
        ? AppColors
              .darkLightContainerColor // dark card color similar to screenshot
        : AppColors.darkModeContainerColor;
    final innerBg = theme.brightness == Brightness.dark
        ? AppColors
              .darkModeContainerColor // dark card color similar to screenshot
        : AppColors.darkLightContainerColor;

    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        return Container(
          // use Container to get custom shadow + radius similar to design
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              // subtle soft shadow
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
              const Text(
                'You Pay',
                style: TextStyle(color: AppColors.gray, fontSize: 13),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '\$${state.amountPay.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 22,
                        color: theme.brightness == Brightness.dark
                            ? AppColors.mainColor
                            : AppColors.darkModeContainerColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // currency pill
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.darkLightContainerColor,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.attach_money,
                          size: 18,
                          color: Colors.orangeAccent,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          state.payCurrency,
                          style: TextStyle(
                            color: theme.brightness == Brightness.dark
                                ? AppColors.mainColor
                                : Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          size: 18,
                          color: AppColors.mainColor,
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
              const Text(
                'You Receive',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      state.receiveAmount.toStringAsFixed(4),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.darkLightContainerColor,
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
                            color: AppColors.darkModeBackGroundColor,
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
                        const SizedBox(width: 8),
                        Text(
                          state.receiveCurrency,
                          style: const TextStyle(color: AppColors.mainColor),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          size: 18,
                          color: AppColors.mainColor,
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
