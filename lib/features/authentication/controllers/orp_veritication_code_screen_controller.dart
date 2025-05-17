import 'dart:async';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final int otpLength = 6;
  final RxString otpCode = ''.obs;
  final RxInt secondsRemaining = 90.obs;
  Timer? _timer;

  bool get canResend => secondsRemaining.value == 0;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    secondsRemaining.value = 90;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void updateOtp(String value) {
    otpCode.value = value;
  }

  void resendCode() {
    // TODO: trigger your resend logic here
    print("Resend OTP");
    startTimer();
  }

  void verifyOtp() {
    // TODO: verify the OTP (e.g., call your backend)
    print("Entered OTP: ${otpCode.value}");
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}