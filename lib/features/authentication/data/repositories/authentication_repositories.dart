

import 'dart:developer';

import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/common/widgets/progress_indicator.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';

import '../../../../routes/app_routes.dart';

class AuthenticationRepositories{

  Future<void> createAccount(Map<String, dynamic> requestBody) async{

    try{
      showProgressIndicator();
      final response = await NetworkCaller().postRequest(AppUrls.signUp, body: requestBody);
      if(response.isSuccess){
        Get.back();
        AppSnackBar.showSuccess(response.responseData['message']);
        Get.toNamed(AppRoute.signUpVeryficationCodeScreen, arguments: requestBody['email']);
      }
      else{
        Get.back();
        AppSnackBar.showError("Already have an account!");
      }
    }catch(e){
      Get.back();
      AppSnackBar.showError(e.toString());
    }
  }

  Future<void> registerOTP(Map<String, dynamic> requestBody) async{

    try{
      showProgressIndicator();
      final response = await NetworkCaller().postRequest(AppUrls.registerOTPAPI, body: requestBody);
      if(response.statusCode == 200){
        Get.back();
        AppSnackBar.showSuccess(response.responseData['message']);
        log("Access Token: ${response.responseData['data']['accessToken']}, ${response.responseData['data']['updateUserInfo']["id"]}");
        AuthService.saveToken(response.responseData['data']['accessToken'], id: response.responseData['data']['updateUserInfo']["id"]);
        Get.toNamed(AppRoute.accountConfirmScreen);
      }
      else{
        Get.back();
        AppSnackBar.showError(response.statusCode.toString());
      }
    }catch(e){
      Get.back();
      AppSnackBar.showError(e.toString());
    }
  }

  Future<void> login(Map<String, dynamic> requestBody) async{
 
    try{
      showProgressIndicator();
      final response = await NetworkCaller().postRequest(AppUrls.login, body: requestBody);
      if(response.isSuccess){
        Get.back();
        AppSnackBar.showSuccess(response.responseData['message']);
        log("Access Token: ${response.responseData['data']['accessToken']}, ${response.responseData['data']['id']}");
        AuthService.saveToken(response.responseData['data']['accessToken'], id:  response.responseData['data']['id']);
        Get.offAllNamed(AppRoute.nevBar);
      }
      else if(response.statusCode == 404){
        Get.back();
        AppSnackBar.showError("User Not Found!!");
      }
      else{
        Get.back();
        AppSnackBar.showError(response.statusCode.toString());
      }
    }catch(e){
      Get.back();
      AppSnackBar.showError(e.toString());
    }
  }

  Future<void> sendOTPToEmail(Map<String, dynamic> requestBody) async{

    try{
      showProgressIndicator();
      final response = await NetworkCaller().postRequest(AppUrls.sendOTPToEmail, body: requestBody);
      if(response.isSuccess){
        Get.back();
        AppSnackBar.showSuccess(response.responseData['message']);
        Get.toNamed(AppRoute.signInVeryficationCodeScreen, arguments: requestBody['email']);
      }
      else if(response.statusCode == 404){
        Get.back();
        AppSnackBar.showError("User Not Found!!");
      }
      else{
        Get.back();
        AppSnackBar.showError(response.statusCode.toString());
      }
    }catch(e){
      Get.back();
      AppSnackBar.showError(e.toString());
    }
  }

  Future<void> verifyOTP(Map<String, dynamic> requestBody) async{

    try{
      showProgressIndicator();
      final response = await NetworkCaller().postRequest(AppUrls.verifyOTP, body: requestBody);
      if(response.isSuccess){
        Get.back();
        AppSnackBar.showSuccess(response.responseData['message']);
        final token = response.responseData['data'];
        Get.toNamed(AppRoute.resetPasswordScreen, arguments: token);
      }
      else if(response.statusCode == 404){
        Get.back();
        AppSnackBar.showError("User Not Found!!");
      }
      else{
        Get.back();
        AppSnackBar.showError(response.statusCode.toString());
      }
    }catch(e){
      Get.back();
      AppSnackBar.showError(e.toString());
    }
  }

  Future<void> resetPassword(Map<String, dynamic> requestBody) async{

    try{
      showProgressIndicator();
      final response = await NetworkCaller().postRequest(AppUrls.resetPassword, body: requestBody);
      if(response.isSuccess){
        Get.back();
        AppSnackBar.showSuccess(response.responseData['message']);
        final token = response.responseData['data'];
        AuthService.saveToken(token);
        Get.toNamed(AppRoute.nevBar);
      }
      else if(response.statusCode == 404){
        Get.back();
        AppSnackBar.showError("Failed to reset!!");
      }
      else{
        Get.back();
        AppSnackBar.showError(response.statusCode.toString());
      }
    }catch(e){
      Get.back();
      AppSnackBar.showError(e.toString());
    }
  }

}