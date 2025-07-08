import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/utils/validators/app_validator.dart';
import 'package:shuroo/features/authentication/data/repositories/authentication_repositories.dart';

class SignInScreenController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  RxBool obscureText = true.obs;
  String? email;
  String? pass;
  RxBool isChecked = false.obs;
  RxBool isCheckemailAndPassword = true.obs;
  var fcmToken = "";

  @override
  void onInit() {
    initializeFCM();
    // TODO: implement onInit
    super.onInit();

  }

  Future<void> initializeFCM() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (Platform.isIOS) {
      String? apnsToken;
      int attempts = 0;
      const int maxAttempts = 10;

      do {
        apnsToken = await FirebaseMessaging.instance.getAPNSToken();
        await Future.delayed(const Duration(milliseconds: 300));
        attempts++;
      } while (apnsToken == null && attempts < maxAttempts);

      log("APNS Token: $apnsToken");
    }

    String? token = await FirebaseMessaging.instance.getToken();

    fcmToken = token ?? "";
    log("FCM Token: $fcmToken");
  }

  void toggleCheckbox(bool value) {
    isChecked.value = value;
  }

  Future<void> emailAndPasswordvalidatorCheck() async {
    email = AppValidator.validateEmail(emailController.text);
    pass = AppValidator.validatePassword(passController.text);
    print("................${email}");

    if (email == null&&pass==null){
      print("................${isCheckemailAndPassword}");

      isCheckemailAndPassword.value = true;
    } else {
      isCheckemailAndPassword.value = false;
    }
  }

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }


  void requestToLogin(){
    if(emailController.text.isNotEmpty && passController.text.isNotEmpty){
      final requestBody = {
        "email": emailController.text,
        "password": passController.text,
        'fcmToken': fcmToken,
      };
      final object = AuthenticationRepositories();
      object.login(requestBody);
    }
    else{
      AppSnackBar.showError("Enter all the inputs");
    }
  }
}
