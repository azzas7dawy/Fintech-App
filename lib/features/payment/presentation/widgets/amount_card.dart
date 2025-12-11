import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/features/payment/presentation/widgets/amount_card_containuer.dart';
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
        return AmountCardContainer(
          theme: theme,
          cardBg: cardBg,
          innerBg: innerBg,
          state: state,
        );
      },
    );
  }
}
