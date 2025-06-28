// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/features/authentication/data/repositories/authentication_repositories.dart';

import '../../../core/utils/validators/app_validator.dart';

class FilledScreenController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController indicatorController = TextEditingController();
  RxBool obscureText = true.obs;
  RxBool isCheck = true.obs;
  RxBool isCheckd = true.obs;
  RxString checkValue = "".obs;

  void requestToCreateAccount() {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        passController.text.isNotEmpty) {
      if (passController.text.length > 7) {
        if (GetUtils.isEmail(emailController.text)) {
          final requestBody = {
            "name": nameController.text,
            "email": emailController.text,
            "phone": phoneController.text,
            "password": passController.text
          };

          final object = AuthenticationRepositories();
          object.createAccount(requestBody);
        } else {
          Get.snackbar("Error", "Enter a valid Email Format",
              backgroundColor: Colors.red.withAlpha(180),
              colorText: Colors.white);
        }
      } else {
        Get.snackbar("Error", "Password length have at least 8",
            backgroundColor: Colors.red.withAlpha(180),
            colorText: Colors.white);
      }
    } else {
      Get.snackbar("Error", "Give All The Information",
          backgroundColor: Colors.red.withAlpha(180), colorText: Colors.white);
    }
  }

  getValidator(String qw) {
    checkValue.value = AppValidator.customValidatePassword(qw)!;

    print("........less.......${checkValue.value}..");

    if (checkValue.value.contains("less")) {
      print("........less.........");
      indicatorController.text = "gh";
    }
    if (checkValue.value.contains("yellow")) {
      indicatorController.text = "AAAAAAAAAAA";
    }
    if (checkValue.value.contains("green")) {
      indicatorController.text = "@Aghu2398";
    }
  }
}
