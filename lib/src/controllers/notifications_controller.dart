import 'package:blott_mobile_test/src/controllers/api_processor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationsController extends GetxController {
  static NotificationsController get instance {
    return Get.find<NotificationsController>();
  }

  var isNotificationGranted = false.obs;

  void requestPermissionToSendNotifications() async {
    Get.defaultDialog(
      title: '"Blott" would like to Send You Notifications Denied',
      content: const Text(
        'Notifications may include alerts, sounds, and icon badges. These can be configured in Settings.',
      ),
      onConfirm: () async {
        PermissionStatus permissionStatus =
            await Permission.notification.request();

        if (permissionStatus.isGranted) {
          isNotificationGranted.value = true;
          ApiProcessorController.successSnack("Notifications are enabled");
        } else if (permissionStatus.isDenied) {
          Permission.accessNotificationPolicy.request();
        } else if (permissionStatus.isPermanentlyDenied) {
          openAppSettings();
        }
      },
      textConfirm: 'Allow',
      textCancel: "Don't Allow",
    );
  }
}
