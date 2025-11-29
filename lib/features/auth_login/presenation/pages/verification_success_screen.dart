import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/auth_background.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/home_indictor.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/login_primery_bottom.dart';
import 'package:flutter/material.dart';

class VerificationSuccessScreen extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback? onButtonPressed;

  const VerificationSuccessScreen({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          const AuthBackground(),
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  const Center(
                    child: Text(
                      'Verify account',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Center(
                    child: Container(
                      width: 150,
                      padding: const EdgeInsets.symmetric(
                        vertical: 28,
                        horizontal: 32,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                            color: Colors.black.withOpacity(0.10),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: AppColors.primary,
                            child: Icon(
                              Icons.check,
                              size: 38,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const Spacer(),
                  PrimaryButton(
                    text: buttonText,
                    onPressed: onButtonPressed,
                  ),
                  const SizedBox(height: 24),
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