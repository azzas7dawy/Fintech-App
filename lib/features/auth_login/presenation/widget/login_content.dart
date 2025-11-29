import 'package:fintech_app/features/auth_login/presenation/cubit/login_cubit.dart';
import 'package:fintech_app/features/auth_login/presenation/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fintech_app/features/auth_login/presenation/widget/header_section.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/login_form.dart';
import 'package:fintech_app/features/auth_login/presenation/widget/sign_up_bottom.dart';
import 'package:go_router/go_router.dart';

class LoginContent extends StatelessWidget {
  const LoginContent();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          // بعد تسجيل الدخول
          context.go('/homePage'); // ⭐ لو عندك روت تاني قولي اسمه
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 98),
                  HeaderSection(),
                  const SizedBox(height: 52),
                  const LoginForm(),
                  const SizedBox(height: 24),
                  const BottomSignUpText(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
