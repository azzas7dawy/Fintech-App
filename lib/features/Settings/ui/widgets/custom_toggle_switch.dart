import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomToggleSwitch extends StatelessWidget {
  const CustomToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return GestureDetector(
      onTap: () {
        context.read<ThemeCubit>().toggleTheme(isDark);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 50.0.w,
        height: 28.0.h,
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.primaryDark
              : AppColors.neutral500.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(14.0.r),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              left: isDark ? 2.0.w : 24.0.w,
              top: 2.0.h,
              child: Container(
                width: 24.0.w,
                height: 24.0.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 4.0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
