import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AppSnackBar {
  static void showError(String message, {String title = 'Error'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Color(0xffDC143C),
      colorText: Colors.white,
      borderRadius: 10.0,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(15.0),
      duration: const Duration(seconds: 3),
      icon: Icon(
        Icons.error_outline,
        color: Colors.white,
        size: 30,
      ),
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  static void showSuccess(String message, {String title = 'Success'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.withOpacity(0.9),
      colorText: Colors.white,
      borderRadius: 10.0,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(15.0),
      duration: const Duration(seconds: 3),
      icon: Icon(
        Icons.error_outline,
        color: Colors.white,
        size: 30,
      ),
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
    );
  }
}
