import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class EmailReceiptSwitchRow extends StatelessWidget {
  final bool value;
  final Color primaryDark;
  final ValueChanged<bool> onChanged;

  const EmailReceiptSwitchRow({
    super.key,
    required this.value,
    required this.primaryDark,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(
          'Send receipt to your email',
          style: AppTextStyles.styles.latoW500S12.copyWith(
            color: AppColors.gray,
          ),
        ),
        const Spacer(),
        Switch(
          value: value,
          activeColor: AppColors.mainColor,
          activeTrackColor: primaryDark,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
