import 'package:blott_mobile_test/app/login/screen/login.dart';
import 'package:blott_mobile_test/app/startup/screen/startup_splash_screen.dart';
import 'package:get/get.dart';

class Routes {
  //Screens Route Names
  static const startupSplashScreen = "/";
  static const login = "/login";

  //Subroutes

  //========================= GET PAGES ==========================\\
  static final getPages = [
    //Startup Screens
    GetPage(name: startupSplashScreen, page: () => const StartupSplashScreen()),

    //Auth Screen
    GetPage(name: login, page: () => const Login()),

    //Main App
  ];
}
