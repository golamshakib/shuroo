import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/features/authentication/data/repositories/authentication_repositories.dart';

class ResetPasswordScreenController extends GetxController{
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  var token = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(Get.arguments != null){
      token.value = Get.arguments;
    }
  }


  void requestToResetPassword(){

    if(newPassController.text.isNotEmpty && confirmPassController.text.isNotEmpty){
      if(newPassController.text.isNotEmpty == confirmPassController.text.isNotEmpty){
        if(newPassController.text.isNotEmpty && confirmPassController.text.isNotEmpty){

          final requestBody = {
            "token": token.value.toString(),
            "password": newPassController.text.toString()
          };

          final object = AuthenticationRepositories();
          object.resetPassword(requestBody);
        }
        else{
          AppSnackBar.showError("Min length 8");
        }
      }
      else{
        AppSnackBar.showError("Passwords don't match!!");
      }
    }
    else{
      AppSnackBar.showError("Fill all the fields");
    }
  }
}