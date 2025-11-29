import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/core/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconForToggleMode extends StatelessWidget {
  const IconForToggleMode({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<ThemeCubit>().toggleTheme(
          Theme.of(context).brightness == Brightness.dark,
        );
      },
      icon: Icon(
        context.isDarkMode ? Icons.dark_mode : Icons.light_mode,
        color: context.mainText,
        size: 35.w,
      ),
    );
  }
}
