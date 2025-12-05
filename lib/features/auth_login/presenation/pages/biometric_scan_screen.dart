import 'package:fintech_app/core/services/biometric_service.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/auth_background.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/home_indictor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef AuthSuccessBuilder = void Function(BuildContext context);

class BiometricScanScreen extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final AuthSuccessBuilder onAuthenticated;

  const BiometricScanScreen({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onAuthenticated,
  });

  @override
  State<BiometricScanScreen> createState() => _BiometricScanScreenState();
}

class _BiometricScanScreenState extends State<BiometricScanScreen> {
  bool _isProcessing = false;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _startAuth();
  }

  Future<void> _startAuth() async {
    setState(() {
      _isProcessing = true;
      _errorText = null;
    });

    final ok = await BiometricService.instance.authenticate(
      reason: widget.title,
    );

    if (!mounted) return;

    setState(() {
      _isProcessing = false;
    });

    if (ok) {
      widget.onAuthenticated(context);
    } else {
      setState(() {
        _errorText = 'Authentication failed or cancelled';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          const AuthBackground(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.h, vertical: 16.h),
              child: Column(
                children: [
                  SizedBox(height: 32.h),
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.styles.latoW600S22.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 32.h,
                      horizontal: 32.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.r),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 16,
                          offset: Offset(0, 8.h),
                          color: Colors.black.withOpacity(0.10),
                        ),
                      ],
                    ),
                    child: Icon(
                      widget.icon,
                      size: 80.r,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    widget.description,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.styles.latoW400S14.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  if (_isProcessing)
                    const CircularProgressIndicator()
                  else if (_errorText != null) ...[
                    Text(
                      _errorText!,
                      style: AppTextStyles.styles.latoW400S13.copyWith(
                        color: Colors.redAccent,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: _startAuth,
                      child: const Text('Try again'),
                    ),
                  ],
                  const Spacer(),
                  const HomeIndicator(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
