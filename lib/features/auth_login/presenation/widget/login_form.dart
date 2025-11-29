import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/features/auth_login/presenation/cubit/login_cubit.dart';
import 'package:fintech_app/features/auth_login/presenation/cubit/login_state.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/app_text_field.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/custom_driver.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/login_primery_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm();

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
              controller: _emailController,
              hintText: 'E-mail ID',
              prefixIcon: Icons.mail_outline,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: _passwordController,
              hintText: 'Password',
              prefixIcon: Icons.lock_outline,
              obscureText: true,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() => _rememberMe = value ?? false);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const Text(
                  'Remember me',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // TODO: navigate to forgot password
                  },
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            PrimaryButton(
              text: state is LoginLoading ? "Loading..." : "Login",
              onPressed: state is LoginLoading
                  ? null
                  : () {
                      context.read<LoginCubit>().login(
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                      );
                    },
            ),
            const SizedBox(height: 24),
            const OrDivider(),
            const SizedBox(height: 16),
            const SocialRow(),
          ],
        );
      },
    );
  }
}
