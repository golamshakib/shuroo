import 'dart:async';
import 'package:get/get.dart';

class SingUpVerificationController extends GetxController {
  final int totalSeconds = 90; // 1 minute 30 seconds
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
    startTimer();
  }

  void startTimer() {
    secondsRemaining.value = totalSeconds;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void resendCode() {
    // TODO: Hook your resend API logic here
    startTimer();
  }

  void verifyOtp(String otp) {
    // TODO: Handle OTP verification logic here
    print("Verifying OTP: $otp");
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
