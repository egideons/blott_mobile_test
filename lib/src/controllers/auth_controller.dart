import 'dart:async';

import 'package:blott_mobile_test/app/login/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get instance {
    return Get.find<AuthController>();
  }

  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () {
      loadApp();
    });
    super.onInit();
  }

  Future<void> loadApp() async {
    await Get.offAll(
      () => const Login(),
      routeName: "/intro",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      predicate: (routes) => false,
      popGesture: false,
      transition: Get.defaultTransition,
    );

    // var isLoggedIn = prefs.getBool("isLoggedIn") ?? false;

    // if (isLoggedIn) {
    // await Get.offAll(
    //   () => const BottomNav(),
    //   routeName: "/explore",
    //   fullscreenDialog: true,
    //   curve: Curves.easeInOut,
    //   predicate: (routes) => false,
    //   popGesture: false,
    //   transition: Get.defaultTransition,
    // );
    // }
    // await Get.offAll(
    //   () => const Intro(),
    //   routeName: "/intro",
    //   fullscreenDialog: true,
    //   curve: Curves.easeInOut,
    //   predicate: (routes) => false,
    //   popGesture: false,
    //   transition: Get.defaultTransition,
    // );
  }
}
