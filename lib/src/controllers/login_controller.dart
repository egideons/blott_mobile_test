import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance {
    return Get.find<LoginController>();
  }

  //=========== Variables =============\\
  var formKey = GlobalKey<FormState>();

  //=========== Booleans =============\\
  var formIsValid = false.obs;
  var isLoading = false.obs;

  //=========== Controllers =============\\
  var firstNameEC = TextEditingController();
  var lastNameEC = TextEditingController();

  //=========== Focus Nodes =============\\
  var firstNameFN = FocusNode();
  var lastNameFN = FocusNode();

  //=========== On Changed =============\\
  firstNameOnChanged(String value) {
    if (value.isEmpty) {
      formIsValid.value = false;
    } else {
      formIsValid.value = true;
    }
  }

  lastNameOnChanged(String value) {
    if (value.isEmpty) {
      formIsValid.value = false;
    } else {
      formIsValid.value = true;
    }
  }

  Future<void> login() async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 3));

    isLoading.value = false;
  }
}
