import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSignUpText extends StatelessWidget {
  const BottomSignUpText();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Text(
            "no_account".tr(),
            style: AppTextStyles.styles.latoW400S14.copyWith(
              color: AppColors.shadowColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "sign_up".tr(),
              style: AppTextStyles.styles.latoW400S16.copyWith(
                color: AppColors.mainColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
