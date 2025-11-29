import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildCardTypeChip(
  String text, {
  bool selected = false,
  Image? logoImage,
}) {
  return Expanded(
    child: Container(
      height: 36,
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        // color: selected ? _primaryDark : _lightBox,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: logoImage != null
            ? Image(
                // color: selected ? Colors.white : _primaryDark,
                image: logoImage.image,
              )
            : Text(
                text,
                style: const TextStyle(
                  // color: selected ? Colors.white : _primaryDark,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
      ),
    ),
  );
}
