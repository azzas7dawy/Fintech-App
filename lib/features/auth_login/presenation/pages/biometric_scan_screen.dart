import 'package:fintech_app/core/services/biometric_service.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/auth_background.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/home_indictor.dart';
import 'package:flutter/material.dart';


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
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32, horizontal: 32),
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
                    child: Icon(
                      widget.icon,
                      size: 80,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    widget.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (_isProcessing)
                    const CircularProgressIndicator()
                  else if (_errorText != null) ...[
                    Text(
                      _errorText!,
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 13,
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
