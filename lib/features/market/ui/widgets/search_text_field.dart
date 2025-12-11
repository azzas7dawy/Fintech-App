import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/features/market/ui/cubits/coins_cubit/crypto_market_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/assets.dart';
import '../../../../core/constant/translation_keys.dart';
import '../../../../core/theme/app_colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
     onChanged: (value) {
  context.read<CryptoMarketCubit>().searchCrypto(value);
},

      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsetsDirectional.only(start: 15.0.w, end: 10.0.w),
          child: SvgPicture.asset(
            Assets.imagesSearch,
            width: 24.0.w,
            height: 24.0.h,
            colorFilter: ColorFilter.mode(context.iconColor, BlendMode.srcIn),
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
              colorFilter: ColorFilter.mode(context.iconColor, BlendMode.srcIn),
            ),
          ),
        ),
        hintText: TranslationKeys.search.tr(),
        hintStyle: AppTextStyles.styles.latoW400S16.copyWith(
          color: AppColors.neutral300,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.r),
          borderSide: BorderSide(color: context.cardBackground),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.r),
          borderSide: BorderSide(color: context.cardBackground),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.r),
          borderSide: BorderSide(color: context.cardBackground),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.r),
          borderSide: BorderSide(color: context.errorBackground),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.r),
          borderSide: const BorderSide(color: AppColors.neutral300),
        ),
        fillColor: context.cardBackground,
        filled: true,
      ),
    );
  }
}
