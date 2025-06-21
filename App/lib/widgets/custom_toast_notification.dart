import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
enum NotificationType { success, error }

class  CustomToastNotification{
  static void display(String? message, NotificationType type) {
    toastification.dismissAll();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      toastification.show(
        context: Get.overlayContext!,
        type: type == NotificationType.success
            ? ToastificationType.success
            : ToastificationType.error,
        style: ToastificationStyle.flat,
        alignment: Alignment.bottomCenter,
        autoCloseDuration: const Duration(seconds: 5),
        primaryColor: Colors.white,
        backgroundColor: type == NotificationType.success
            ? Colors.green
            : Colors.red,
        foregroundColor: Colors.white,
        showProgressBar: false,
        title: Text(
          message ?? '',
          style: const TextStyle(color: Colors.white),
          maxLines: null,
          softWrap: true,
        ),
      );
    });
  }
}
