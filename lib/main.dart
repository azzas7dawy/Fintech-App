import 'package:fintech_app/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   //==================== Load .env file =================//
 await dotenv.load(fileName:'.env');
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
  runApp(const CoinsApp());
  
  
}
