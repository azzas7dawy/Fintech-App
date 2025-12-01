
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/features/payment/presentation/cubits/payment_statue.dart';
import 'package:fintech_app/features/payment/presentation/widgets/currency_pill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RateRow extends StatelessWidget {
  const RateRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         SizedBox(width: 50.w),
         Icon(
          Icons.circle,
          size: 8.sp,
          color: AppColors.orangColor,
        ),
        const SizedBox(width: 8),
        Text(
          '1 USD = 0.00078 ETH',
          style: AppTextStyles.styles.latoW500S14.copyWith(
            color: AppColors.gray500,
          ),
        ),
        //
      ],
    );
  }
}

class YouPayRow extends StatelessWidget {
  final ThemeData theme;
  final PaymentState state;

  const YouPayRow({
    required this.theme,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '\$${state.amountPay.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 22.sp,
              color: theme.brightness == Brightness.dark
                  ? AppColors.mainColor
                  : AppColors.darkModeContainerColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CurrencyPill(
          icon:  Icon(
            Icons.attach_money,
            size: 18.sp,
            color: AppColors.orangColor,
          ),
          text: state.payCurrency,
          textColor: theme.brightness == Brightness.dark
              ? AppColors.mainColor
              : Colors.black87,
        ),
      ],
    );
  }
}