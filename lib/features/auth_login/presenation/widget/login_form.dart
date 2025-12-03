import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/features/auth_login/presenation/cubit/login_cubit.dart';
import 'package:fintech_app/features/auth_login/presenation/cubit/login_state.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/app_text_field.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/custom_driver.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/login_primery_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              hintText: "email".tr(),
              prefixIcon: Icons.mail_outline,
              keyboardType: TextInputType.emailAddress,
            ),

            SizedBox(height: 16.h),

            AppTextField(
              controller: _passwordController,
              hintText: "password".tr(),
              prefixIcon: Icons.lock_outline,
              obscureText: true,
            ),

            SizedBox(height: 12.h),

            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() => _rememberMe = value ?? false);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),

                Text(
                  "remember_me".tr(),
                  style: AppTextStyles.styles.latoW400S13.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),

                const Spacer(),

                TextButton(
                  onPressed: () {
                    // TODO: Navigate to Forgot Password
                  },
                  child: Text(
                    "forget_password".tr(),
                    style: AppTextStyles.styles.latoW500S12.copyWith(
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 12.h),

            PrimaryButton(
              text: state is LoginLoading ? "Loading...".tr() : "login".tr(),
              onPressed: state is LoginLoading
                  ? null
                  : () {
                      context.read<LoginCubit>().login(
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                      );
                    },
            ),

            SizedBox(height: 24.h),

            const OrDivider(),

            SizedBox(height: 16.h),

            const SocialRow(),
          ],
        );
      },
    );
  }
}
