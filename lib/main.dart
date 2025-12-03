import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/app.dart';
import 'package:fintech_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ================== Firebase Initialization =================//
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //================= Easy Localization Initialization =================//
  await EasyLocalization.ensureInitialized();

  //================= Hydrated Bloc Initialization for themeing =================//
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  //======================= setupGetIt =============
  // await setupGetIt();
  await ScreenUtil.ensureScreenSize();

  //===================== hive ==============
  // تهيئة Hive
  await Hive.initFlutter();

  //==================
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const CoinsApp(),
    ),
  );
}
