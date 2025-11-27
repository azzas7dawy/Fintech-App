import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // Containers / Surfaces
  Color get containerBackground =>
      isDarkMode ? AppColors.surfaceVariant : const Color(0xFFE3E5EA);

  // Text
  Color get primaryText => isDarkMode ? Colors.white : Colors.black;
  Color get mainText => isDarkMode ? Colors.white : AppColors.primaryDark;

  Color get secondaryText =>
      isDarkMode ? const Color(0xFFB0B0B0) : AppColors.textSecondary;

  Color get bttnav => AppColors.primary;

  // Icons
  Color get iconColor => isDarkMode ? Colors.white70 : Colors.black87;

  // Cards
  Color get cardBackground =>
      isDarkMode ? AppColors.surfaceVariant : Colors.white;

  Color get cardBorderColor =>
      isDarkMode ? Colors.white10 : const Color(0xFFE5E7EB);

  List<BoxShadow> get cardShadow => isDarkMode
      ? []
      : [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 10,
      offset: const Offset(0, 2),
    ),
  ];
}
