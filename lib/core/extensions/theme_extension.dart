import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_colors_theme.dart';
import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  AppColorsTheme get _colors => Theme.of(this).extension<AppColorsTheme>()!;

  // Containers / Surfaces
  Color get containerBackground => _colors.containerBackground;
  Color get portfolioBackgroundSelectedTabBar =>
      _colors.portfolioBackgroundSelectedTabBar;
  Color get portfolioSelectedTextTabBar => _colors.portfolioSelectedTextTabBar;

  // Text
  Color get primaryText => _colors.primaryText;
  Color get mainText => _colors.mainText;
  Color get secondaryText => _colors.secondaryText;
  Color get textOnDark => _colors.textOnDark;
  Color get textGreen => _colors.textGreen;

  Color get bttnav => AppColors.primary;

  // Icons
  Color get iconColor => _colors.iconColor;
  Color get iconBackground => _colors.iconBackground;
  // Cards
  Color get cardBackground => _colors.cardBackground;
  Color get cardBorderColor => _colors.cardBorderColor;
  List<BoxShadow> get cardShadow => _colors.cardShadow;

  // Status Colors
  Color get successBackground => _colors.successBackground;
  Color get successPrimary => _colors.successPrimary;
  Color get successText => _colors.successText;
  Color get errorBackground => _colors.errorBackground;
  Color get errorText => _colors.errorText;
  Color get infoColor => _colors.infoColor;

  // Utility
  Color get divider => _colors.divider;
  Color get toggleBackground => _colors.toggleBackground;
}
