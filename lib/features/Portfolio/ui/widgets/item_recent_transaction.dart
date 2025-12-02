import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/models/recent_transaction_model.dart';
import 'amount_details.dart';
import 'icon_transaction.dart';
import 'transaction_details.dart';

class ItemRecentTransaction extends StatelessWidget {
  const ItemRecentTransaction({super.key, required this.model});

  final RecentTransactionModel model;

  bool get isBuy => model.transactionType.toLowerCase() == 'buy';

  @override
  Widget build(BuildContext context) {
    final iconColor = isBuy
        ? (context.isDarkMode
              ? AppColors.successPrimaryDark
              : AppColors.successPrimaryLight)
        : AppColors.errorPrimary;

    final iconBackgroundColor = isBuy
        ? context.successBackground
        : context.errorBackground;

    final fiatAmountColor = model.fiatAmount.startsWith('+')
        ? context.textGreen
        : (model.fiatAmount.startsWith('-')
              ? AppColors.errorPrimary
              : context.mainText);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 21.h),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: context.cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Row(
        children: [
          // Left Section - Icon
          IconTransaction(
            iconBackgroundColor: iconBackgroundColor,
            iconColor: iconColor,
            isBuy: isBuy,
          ),
          SizedBox(width: 18.0.w),
          // Middle Section - Transaction Details
          TransactionDetails(model: model),
          // Right Section - Amount Details
          AmountDetails(model: model, fiatAmountColor: fiatAmountColor),
        ],
      ),
    );
  }
}
