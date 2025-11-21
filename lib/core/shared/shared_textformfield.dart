import 'package:fintech_app/core/shared/app_text_styles.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SharedTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool enabled;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Color? fillColor;
  final bool filled;
  final bool readOnly;
  final String? serverError;
  final bool forceValidation;
  final List<TextInputFormatter>? inputFormatters;

  const SharedTextFormField({
    super.key,
    this.controller,
    this.initialValue,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.validator,
    this.onEditingComplete,
    this.onTap,
    this.focusNode,
    this.contentPadding,
    this.style,
    this.hintStyle,
    this.labelStyle,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.fillColor,
    this.filled = true,
    this.readOnly = false,
    this.serverError,
    this.forceValidation = false,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    // Define default borders to avoid repeating in every usage site.
    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: AppColors.gray,
        width: 1,
      ),
    );

    final defaultFocusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.gray400, width: 2),
    );

    return TextFormField(
      key: key,
      controller: controller,
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle,
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon,
        errorStyle: AppTextStyles.bodyMedium.copyWith(
          color: Colors.red,
          fontSize: 13.sp,
          height: 1.2, // Better line height for multi-line errors
        ),
        errorMaxLines: 3, // Allow error text to wrap up to 3 lines
        suffixIcon: suffixIcon,
        contentPadding: contentPadding,
        border: border ?? defaultBorder,
        enabledBorder: enabledBorder ?? defaultBorder,
        focusedBorder: focusedBorder ?? defaultFocusedBorder,
        fillColor: fillColor ?? AppColors.gray,
        filled: filled,
        // Don't show errorText immediately - let validator handle it
      ),
      obscureText: obscureText,
      enabled: enabled,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      validator: validator,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      focusNode: focusNode,
      style: style ?? AppTextStyles.bodyMedium,
      readOnly: readOnly,
    );
  }
}
