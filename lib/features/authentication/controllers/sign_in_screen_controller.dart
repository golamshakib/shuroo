import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
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
        "password": passController.text
      };
      final object = AuthenticationRepositories();
      object.login(requestBody);
    }
    else{
      AppSnackBar.showError("Enter all the inputs");
    }
  }
}
