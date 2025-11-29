import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/assets.dart';
import '../../../../core/constant/translation_keys.dart';
import '../../../../core/theme/app_colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },

      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsetsDirectional.only(start: 15.0.w, end: 10.0.w),
          child: SvgPicture.asset(
            Assets.imagesSearch,
            width: 24.0.w,
            height: 24.0.h,
            colorFilter: ColorFilter.mode(
              isDark
                  ? AppColors.lightModeIconColor
                  : AppColors.darkModeIconColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            // TODO: Implement filter functionality
          },
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 10.0.w, end: 15.0.w),

            child: SvgPicture.asset(
              Assets.imagesFilter,
              width: 24.0.w,
              height: 24.0.h,
              colorFilter: ColorFilter.mode(
                isDark
                    ? AppColors.lightModeIconColor
                    : AppColors.darkModeIconColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        hintText: TranslationKeys.search.tr(),
        hintStyle: AppTextStyles.styles.latoW400S16.copyWith(
          color: AppColors.gray300,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.r),
          borderSide: BorderSide(
            color: isDark ? AppColors.darkModeContainerColor : AppColors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.r),
          borderSide: BorderSide(
            color: isDark ? AppColors.darkModeContainerColor : AppColors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.r),
          borderSide: BorderSide(
            color: isDark ? AppColors.darkModeContainerColor : AppColors.white,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.r),
          borderSide: BorderSide(
            color: isDark
                ? AppColors.redColor
                : AppColors.darkModeContainerColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.r),
          borderSide: BorderSide(
            color: isDark
                ? AppColors.darkModeContainerColor
                : AppColors.gray300,
          ),
        ),
        fillColor: isDark ? AppColors.darkModeContainerColor : AppColors.white,
        filled: true,
      ),
    );
  }
}
