import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/routing/app_router.dart';
import 'package:fintech_app/core/theme/cubit/theme_cubit.dart';
import 'package:fintech_app/core/theme/theme_modes/dark_mode.dart';
import 'package:fintech_app/core/theme/theme_modes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinsApp extends StatelessWidget {
  const CoinsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, newMode) {
            log('the mode is $newMode');
            return MaterialApp.router(
               localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: 'Theme App',
              debugShowCheckedModeBanner: false,
              theme: getLightModeTheme(),
              darkTheme: getDarkModeTheme(),
              themeMode: newMode,
              // home: const ToggleThemeScreen(),
               routerConfig: appRouter,
            );
          },
        ),
      ),
    );
  }
}
