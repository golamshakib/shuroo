import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shuroo/core/utils/validators/app_validator.dart';

class SignInScreenController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  RxBool obscureText = true.obs;
  String? email;
  String? pass;
  RxBool isChecked = false.obs;
  RxBool isCheckemailAndPassword = true.obs;

  void toggleCheckbox(bool value) {
    isChecked.value = value;
  }

  void emailAndPasswordvalidatorCheck() {
    email = AppValidator.validateEmail(emailController.text);
    pass = AppValidator.validatePassword(passController.text);
    if (email == null&&pass==null){
      isCheckemailAndPassword.value = false;
    } else {
      isCheckemailAndPassword.value = true;
    }
  }

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }
}
