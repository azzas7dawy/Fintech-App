
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/features/payment/presentation/cubits/payment_statue.dart';
import 'package:fintech_app/features/payment/presentation/widgets/currency_pill.dart';
import 'package:fintech_app/features/payment/presentation/widgets/rate_row.dart';
import 'package:fintech_app/features/payment/presentation/widgets/section_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AmountCardContainer extends StatelessWidget {
  final ThemeData theme;
  final Color cardBg;
  final Color innerBg;
  final PaymentState state;

  const AmountCardContainer({
    required this.theme,
    required this.cardBg,
    required this.innerBg,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // use Container to get custom shadow + radius similar to design
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          // subtle soft shadow
          BoxShadow(
            color: AppColors.darkLightContainerColor
                .withOpacity(theme.brightness == Brightness.dark ? 0.35 : 0.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionLabel(
            text: 'You Pay',
            color: AppColors.gray,
          ),
          const SizedBox(height: 6),
          YouPayRow(theme: theme, state: state),
          const SizedBox(height: 12),

          // thin divider as in design
          Divider(
            color: theme.brightness == Brightness.dark
                ? Colors.white10
                : Colors.grey.shade300,
            height: 1,
          ),
           SizedBox(height: 12.h),

          const SectionLabel(
            text: 'You Receive',
            color: Colors.grey,
          ),
           SizedBox(height: 6.h),
          YouReceiveRow(state: state),
           SizedBox(height: 12.h),
          const RateRow(),
        ],
      ),
    );
  }
}