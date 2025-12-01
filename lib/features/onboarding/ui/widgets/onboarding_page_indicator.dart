import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalPages;

  const OnboardingPageIndicator({
    super.key,
    required this.currentIndex,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        totalPages,
        (index) => _buildIndicator(context, index == currentIndex),
      ),
    );
  }

  Widget _buildIndicator(BuildContext context, bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      width: isActive ? 20.w : 8.w,
      height: 4.h,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryDark : AppColors.neutral300,
        borderRadius: BorderRadius.circular(3.r),
      ),
    );
  }
}
