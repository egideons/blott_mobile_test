import 'package:blott_mobile_test/app/login/content/login_form.dart';
import 'package:blott_mobile_test/src/constants/consts.dart';
import 'package:blott_mobile_test/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../src/controllers/login_controller.dart';

class LoginScaffold extends GetView<LoginController> {
  const LoginScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    //Mobile or Portrait Screen
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      floatingActionButton: Obx(() {
        return FloatingActionButton(
          onPressed: controller.formIsValid.value ? controller.login : null,
          tooltip: "Next",
          backgroundColor: controller.formIsValid.value
              ? kPrimaryColor
              : kDisabledPrimaryColor,
          foregroundColor: kLightBackgroundColor,
          shape: const CircleBorder(),
          disabledElevation: 0,
          elevation: 20,
          child: const Icon(Icons.chevron_right),
        );
      }),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your legal name",
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
                style: defaultTextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: kTextTitleColor,
                ),
              ),
              kSizedBox,
              Text(
                "We need to know a bit about you so that we can create your account.",
                maxLines: 10,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: defaultTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: kTextSubtitleColor,
                ),
              ),
              kSizedBox,
              loginForm(colorScheme, media, controller),
            ],
          ),
        ),
      ),
    );
  }
}
