

import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/features/payment/presentation/cubits/payment_statue.dart';
import 'package:fintech_app/features/payment/presentation/widgets/crypto_currency_pill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyPill extends StatelessWidget {
  final Widget icon;
  final String text;
  final Color textColor;

  const CurrencyPill({
    required this.icon,
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.darkLightContainerColor,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Row(
        children: [
          icon,
          SizedBox(width: 6.w),
          Text(
            text,
            style: TextStyle(color: textColor),
          ),
           SizedBox(width: 4.w),
           Icon(
            Icons.keyboard_arrow_down,
            size: 18.sp,
            color: AppColors.mainColor,
          ),
        ],
      ),
    );
  }
}

class YouReceiveRow extends StatelessWidget {
  final PaymentState state;

  const YouReceiveRow({required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            state.receiveAmount.toStringAsFixed(4),
            style: AppTextStyles.styles.latoW700S22.copyWith(
              color: AppColors.mainColor,
            ),
          ),
        ),
        CryptoCurrencyPill(
          currencyCode: state.receiveCurrency,
        ),
      ],
    );
  }
}
