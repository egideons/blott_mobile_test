import 'package:blott_mobile_test/src/constants/consts.dart';
import 'package:blott_mobile_test/src/utils/reusable/android_textformfield.dart';
import 'package:blott_mobile_test/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
                "${dotenv.env["APIKEY"]}",
                // "Login to your account",
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: defaultTextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: colorScheme.primary,
                ),
              ),
              Text(
                "Welcome back! Please enter your registered email address to continue.",
                maxLines: 4,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: defaultTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: colorScheme.primary,
                ),
              ),
              kSizedBox,
              Form(
                key: controller.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email address",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: defaultTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: colorScheme.primary,
                      ),
                    ),
                    AndroidTextFormField(
                      controller: controller.firstNameEC,
                      hintText: "Enter email",
                      focusNode: controller.firstNameFN,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: controller.firstNameOnChanged,
                      validator: (value) {
                        return null;
                      },
                    ),
                    const SizedBox(height: 4),

                    SizedBox(height: media.height * .36),
                    // GetBuilder<LoginController>(
                    //   init: LoginController(),
                    //   builder: (controller) {
                    //     return MyElevatedButton(
                    //       title: "Continue",
                    //       disable: !controller.formIsValid.value,
                    //       isLoading: controller.isLoading.value,
                    //       onPressed: controller.login,
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
