import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class DividerStatics extends StatelessWidget {
  const DividerStatics({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Divider(
      color: isDark ? AppColors.dividerDark : AppColors.dividerLight,
      height: 1,
    );
  }
}
