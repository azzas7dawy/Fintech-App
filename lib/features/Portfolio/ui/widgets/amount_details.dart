import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/recent_transaction_model.dart';

class AmountDetails extends StatelessWidget {
  const AmountDetails({
    super.key,
    required this.model,
    required this.fiatAmountColor,
  });

  final RecentTransactionModel model;
  final Color fiatAmountColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          model.cryptoAmount,
          style: AppTextStyles.styles.latoW500S15.copyWith(
            color: context.mainText,
            height: 1.43,
          ),
        ),
        SizedBox(height: 4.0.h),
        Text(
          model.fiatAmount,
          style: AppTextStyles.styles.latoW400S12.copyWith(
            color: fiatAmountColor,
            height: 1.33,
          ),
        ),
      ],
    );
  }
}
