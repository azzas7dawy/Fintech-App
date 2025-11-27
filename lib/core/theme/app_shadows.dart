import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:flutter/widgets.dart';

class AppShadows {
  AppShadows._();
  static BoxShadow boxShadow1 = BoxShadow(
    color: AppColors.shadow.withValues(alpha: .6),
    offset: const Offset(0, 1),
    blurRadius: 2,
    spreadRadius: 0,
  );
}
