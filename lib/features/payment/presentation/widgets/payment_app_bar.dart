import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final VoidCallback onBack;

  const PaymentAppBar({
    super.key,
    required this.backgroundColor,
    required this.onBack,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon:  Icon(
          Icons.arrow_back_ios,
          color: AppColors.mainColor,
          size: 18.sp,
        ),
        onPressed: onBack,
      ),
      title:  Text(
        'Payment method',
        style:AppTextStyles.styles.latoW600S16.copyWith(
          color: AppColors.mainColor,
        ),
      ),
    );
  }
}
