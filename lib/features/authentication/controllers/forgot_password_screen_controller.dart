import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shuroo/features/authentication/data/repositories/authentication_repositories.dart';

class ForgotPasswordController extends GetxController{
  final TextEditingController emailController = TextEditingController();


  void requestToSendOTP(){

    if(emailController.text.isNotEmpty && GetUtils.isEmail(emailController.text)){

      final requestBody = {
        "email": emailController.text
      };
      final object = AuthenticationRepositories();
      object.sendOTPToEmail(requestBody);
    }
  }

}