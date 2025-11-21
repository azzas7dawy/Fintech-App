import 'package:fintech_app/core/shared/app_text_styles.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SnackBarType { success, error, warning, info }

class SharedSnackBar extends StatelessWidget {
  final String message;
  final SnackBarType type;
  final String? actionLabel;
  final VoidCallback? onActionPressed;
  final Duration duration;
  final bool showCloseButton;

  const SharedSnackBar({
    super.key,
    required this.message,
    this.type = SnackBarType.info,
    this.actionLabel,
    this.onActionPressed,
    this.duration = const Duration(seconds: 4),
    this.showCloseButton = true,
  });

  Color _getBackgroundColor() {
    switch (type) {
      case SnackBarType.success:
        return Colors.green.shade600;
      case SnackBarType.error:
        return Colors.red.shade600;
      case SnackBarType.warning:
        return Colors.orange.shade600;
      case SnackBarType.info:
        return AppColors.mainColor;
    }
  }

  IconData _getIcon() {
    switch (type) {
      case SnackBarType.success:
        return Icons.check_circle_outline;
      case SnackBarType.error:
        return Icons.error_outline;
      case SnackBarType.warning:
        return Icons.warning_amber_outlined;
      case SnackBarType.info:
        return Icons.info_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Row(
        children: [
          Icon(_getIcon(), color: Colors.white, size: 24.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              message,
              style: AppTextStyles.bodyMedium.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
          if (actionLabel != null && onActionPressed != null) ...[
            SizedBox(width: 8.w),
            GestureDetector(
              onTap: onActionPressed,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  actionLabel!,
                  style: AppTextStyles.bodySmall.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
          if (showCloseButton) ...[
            SizedBox(width: 8.w),
            GestureDetector(
              onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              child: Icon(Icons.close, color: Colors.white.withValues(alpha: 0.8), size: 20.sp),
            ),
          ],
        ],
      ),
    );
  }

  // Static helper methods
  static void showSuccess(
    BuildContext context,
    String message, {
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration? duration,
  }) {
    _showSnackBar(
      context,
      message,
      SnackBarType.success,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      duration: duration,
    );
  }

  static void showError(
    BuildContext context,
    String message, {
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration? duration,
    SnackBarAction? action,
  }) {
    _showSnackBar(
      context,
      message,
      SnackBarType.error,
      actionLabel: actionLabel ?? action?.label,
      onActionPressed: onActionPressed ?? action?.onPressed,
      duration: duration,
    );
  }

  static void showWarning(
    BuildContext context,
    String message, {
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration? duration,
  }) {
    _showSnackBar(
      context,
      message,
      SnackBarType.warning,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      duration: duration,
    );
  }

  static void showInfo(
    BuildContext context,
    String message, {
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration? duration,
  }) {
    _showSnackBar(
      context,
      message,
      SnackBarType.info,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      duration: duration,
    );
  }

  static void _showSnackBar(
    BuildContext context,
    String message,
    SnackBarType type, {
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration? duration,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SharedSnackBar(
          message: message,
          type: type,
          actionLabel: actionLabel,
          onActionPressed: onActionPressed,
          duration: duration ?? const Duration(seconds: 4),
          showCloseButton: false, // We handle dismissal via the SnackBar
        ),
        duration: duration ?? const Duration(seconds: 4),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
