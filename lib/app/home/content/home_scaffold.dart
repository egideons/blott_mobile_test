import 'package:blott_mobile_test/src/controllers/home_controller.dart';
import 'package:blott_mobile_test/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScaffold extends GetView<HomeController> {
  const HomeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: kPrimaryColor),
    );
  }
}
