import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/progress_indicator.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';

import '../../../core/common/widgets/app_snackbar.dart';
import '../data/repositories/authentication_repositories.dart';

class SignInVerificationScreenController extends GetxController{


  final pinTEController = TextEditingController();
  var active = false.obs;
  var email = "".obs;
  final int totalSeconds = 90;
  final RxInt secondsRemaining = 90.obs;
  Timer? _timer;

  bool get isTimerRunning => secondsRemaining.value > 0;
  String get formattedTime {
    final min = (secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final sec = (secondsRemaining % 60).toString().padLeft(2, '0');
    return "$min:$sec";
  }

  @override
  void onInit() {
    super.onInit();
    if(Get.arguments !=  null){
      email.value = Get.arguments;
    }
    startTimer();
  }

  void startTimer() {
    secondsRemaining.value = totalSeconds;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async{
      if (secondsRemaining > 0) {
        secondsRemaining.value--;
      } else {
        timer.cancel();
        await resendOTP();
        startTimer();
      }
    });
  }

  void resendCode() {
    // TODO: Hook your resend API logic here
    startTimer();
  }

  void verifyOtp() {
    // TODO: Handle OTP verification logic here
    if(pinTEController.text.length == 6){
      final requestBody = {
        "email": email.value,
        "otp": int.tryParse(pinTEController.text)
      };

      final object = AuthenticationRepositories();
      object.verifyOTP(requestBody);
    }
    else{
      AppSnackBar.showError("Enter full pin");
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  Future<void> resendOTP() async{

    final requestBody = {
      "email": email.value
    };
    try{
      showProgressIndicator();
      final response = await NetworkCaller().postRequest(AppUrls.resendOTP, token: "Bearer ${AuthService.token}", body: requestBody);

      if(response.isSuccess){
        Get.back();
        secondsRemaining.value = 90;
        startTimer();
        AppSnackBar.showSuccess("OTP resend to ${email.value}");
      }
      else{
        Get.back();
        AppSnackBar.showError(response.errorMessage);
      }
    }catch(e){
      AppSnackBar.showError(e.toString());
    }
  }
}