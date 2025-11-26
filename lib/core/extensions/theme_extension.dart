// lib/core/theme/theme_extensions.dart

import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  
  // ألوان الـ containers
  Color get containerBackground => isDarkMode 
      ?  AppColors.gray800 
      :   const Color.fromARGB(255, 227, 229, 234);
  
  // Color get cardBorder => isDarkMode 
  //     ? const Color(0xFF2C2C2C) 
  //     : const Color(0xFFD1D5DB);
  
  // ألوان النصوص
  Color get primaryText => isDarkMode ? Colors.white : Colors.black;
  Color get mainText => isDarkMode ? Colors.white : const Color(0xFF1D3A70);
  
  Color get secondaryText => isDarkMode 
      ? const Color(0xFFB0B0B0) 
      :  AppColors.gray400;
  
  // ألوان الأيقونات
  Color get iconColor => isDarkMode ? Colors.white70 : Colors.black87;

  Color get cardBackground => isDarkMode ? AppColors.gray800 : Colors.white;

  Color get cardBorderColor => isDarkMode
      ? Colors.white10
      : const Color(0xFFE5E7EB);

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