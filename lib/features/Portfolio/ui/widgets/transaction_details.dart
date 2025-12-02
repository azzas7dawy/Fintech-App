import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/recent_transaction_model.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({super.key, required this.model});

  final RecentTransactionModel model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${model.transactionType} ${model.cryptocurrencyName}',
            style: AppTextStyles.styles.latoW700S16.copyWith(
              color: context.mainText,
            ),
          ),
          Text(
            model.timestamp,
            style: AppTextStyles.styles.latoW500S14.copyWith(
              color: context.secondaryText,
              height: 1.71,
              letterSpacing: 0.28,
            ),
          ),
        ],
      ),
    );
  }
}
