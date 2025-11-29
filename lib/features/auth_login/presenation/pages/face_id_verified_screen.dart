
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/auth_background.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/home_indictor.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/icon_info_card.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/login_primery_bottom.dart';
import 'package:flutter/material.dart';

class FaceIdVerifiedPage extends StatelessWidget {
  const FaceIdVerifiedPage({super.key});

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
                  const SizedBox(height: 46),
             
                  const SizedBox(height: 112),

               
                  Center(
                    child: IconInfoCard(
                      size: 150,
                      padding: const EdgeInsets.symmetric(
                        vertical: 28,
                        horizontal: 32,
                      ),
                      icon: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.darkBlue,
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 38,
                          color: AppColors.darkBlue,
                        ),
                      ),
                      title: 'Face ID',
                    ),
                  ),

                  const SizedBox(height: 40),

                  const Text(
                    "You're verified",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "You have been verified your information completely. Let's make transactions!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const Spacer(),

                  PrimaryButton(
                    text: 'Continue To Home',
                    onPressed: () {
                      // TODO: روح لـ Home Screen
                    },
                  ),
                  const SizedBox(height: 24),
                  const HomeIndicator(color: Colors.black54),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}