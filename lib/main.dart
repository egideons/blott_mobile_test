import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/routes/routes.dart';
import 'src/utils/components/app_error_widget.dart';
import 'theme/colors.dart';

late SharedPreferences prefs;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: kTransparentColor),
  );
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();

  //This is to handle widget errors by showing a custom error widget screen
  if (kReleaseMode) ErrorWidget.builder = (_) => const AppErrorWidget();

  FlutterError.onError = (details) {
    FlutterError.dumpErrorToConsole(details);
    if (!kReleaseMode) return;
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Blott",
      color: kPrimaryColor,
      navigatorKey: Get.key,
      defaultTransition: Transition.native,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      initialRoute: Routes.startupSplashScreen,
      getPages: Routes.getPages,
      themeMode: ThemeMode.system,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        multitouchDragStrategy: MultitouchDragStrategy.sumAllPointers,
      ),
    );
  }
}
