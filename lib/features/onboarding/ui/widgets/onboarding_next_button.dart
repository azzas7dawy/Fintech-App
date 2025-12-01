import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingNextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLastPage;

  const OnboardingNextButton({
    super.key,
    required this.onPressed,
    this.isLastPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 56.w,
        height: 56.w,
        decoration: BoxDecoration(
          color: context.mainText,
          shape: BoxShape.circle,
        ),
        child: Icon(
          isLastPage ? Icons.check : Icons.arrow_forward_ios,
          color: context.cardBackground,
          size: 24.sp,
        ),
      ),
    );
  }
}
