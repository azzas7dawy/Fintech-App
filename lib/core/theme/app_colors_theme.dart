import 'package:flutter/material.dart';

/// Theme extension for app-specific colors that adapt to light/dark themes
class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  // Containers / Surfaces
  final Color containerBackground;
  final Color cardBackground;
  final Color cardBorderColor;
  final List<BoxShadow> cardShadow;

  // Text Colors
  final Color primaryText;
  final Color mainText;
  final Color secondaryText;

  // Icon Colors
  final Color iconColor;

  // Status Colors
  final Color successBackground;
  final Color successPrimary;
  final Color successText;
  final Color errorBackground;
  final Color errorText;
  final Color infoColor;

  // Utility Colors
  final Color divider;
  final Color toggleBackground;

  const AppColorsTheme({
    required this.containerBackground,
    required this.cardBackground,
    required this.cardBorderColor,
    required this.cardShadow,
    required this.primaryText,
    required this.mainText,
    required this.secondaryText,
    required this.iconColor,
    required this.successBackground,
    required this.successPrimary,
    required this.successText,
    required this.errorBackground,
    required this.errorText,
    required this.infoColor,
    required this.divider,
    required this.toggleBackground,
  });

  @override
  ThemeExtension<AppColorsTheme> copyWith({
    Color? containerBackground,
    Color? cardBackground,
    Color? cardBorderColor,
    List<BoxShadow>? cardShadow,
    Color? primaryText,
    Color? mainText,
    Color? secondaryText,
    Color? iconColor,
    Color? successBackground,
    Color? successPrimary,
    Color? successText,
    Color? errorBackground,
    Color? errorText,
    Color? infoColor,
    Color? divider,
    Color? toggleBackground,
  }) {
    return AppColorsTheme(
      containerBackground: containerBackground ?? this.containerBackground,
      cardBackground: cardBackground ?? this.cardBackground,
      cardBorderColor: cardBorderColor ?? this.cardBorderColor,
      cardShadow: cardShadow ?? this.cardShadow,
      primaryText: primaryText ?? this.primaryText,
      mainText: mainText ?? this.mainText,
      secondaryText: secondaryText ?? this.secondaryText,
      iconColor: iconColor ?? this.iconColor,
      successBackground: successBackground ?? this.successBackground,
      successPrimary: successPrimary ?? this.successPrimary,
      successText: successText ?? this.successText,
      errorBackground: errorBackground ?? this.errorBackground,
      errorText: errorText ?? this.errorText,
      infoColor: infoColor ?? this.infoColor,
      divider: divider ?? this.divider,
      toggleBackground: toggleBackground ?? this.toggleBackground,
    );
  }

  @override
  ThemeExtension<AppColorsTheme> lerp(
    covariant ThemeExtension<AppColorsTheme>? other,
    double t,
  ) {
    if (other is! AppColorsTheme) {
      return this;
    }

    return AppColorsTheme(
      containerBackground: Color.lerp(
        containerBackground,
        other.containerBackground,
        t,
      )!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      cardBorderColor: Color.lerp(cardBorderColor, other.cardBorderColor, t)!,
      cardShadow: t < 0.5 ? cardShadow : other.cardShadow,
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      mainText: Color.lerp(mainText, other.mainText, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      successBackground: Color.lerp(
        successBackground,
        other.successBackground,
        t,
      )!,
      successPrimary: Color.lerp(successPrimary, other.successPrimary, t)!,
      successText: Color.lerp(successText, other.successText, t)!,
      errorBackground: Color.lerp(errorBackground, other.errorBackground, t)!,
      errorText: Color.lerp(errorText, other.errorText, t)!,
      infoColor: Color.lerp(infoColor, other.infoColor, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      toggleBackground: Color.lerp(
        toggleBackground,
        other.toggleBackground,
        t,
      )!,
    );
  }
}
