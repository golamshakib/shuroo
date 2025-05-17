import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import '../../controllers/orp_veritication_code_screen_controller.dart';

class SignInVeryficationScreen extends StatelessWidget {
  SignInVeryficationScreen({super.key});

  final OtpController controller = Get.put(OtpController());
  final List<TextEditingController> textControllers =
  List.generate(6, (_) => TextEditingController());

  void _onOtpChanged(int index, String value) {
    if (value.length == 1 && index < 5) {
      FocusScope.of(Get.context!).nextFocus();
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(Get.context!).previousFocus();
    }

    final fullOtp = textControllers.map((e) => e.text).join();
    controller.updateOtp(fullOtp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("OTP Verification")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text("Enter the 6-digit code sent to your phone"),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (i) {
                return SizedBox(
                  width: 45,
                  child: TextField(
                    controller: textControllers[i],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (val) => _onOtpChanged(i, val),
                    decoration: const InputDecoration(counterText: ''),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            GetBuilder<OtpController>(builder: (_) {
              final minutes = (_.secondsRemaining ~/ 60).toString().padLeft(2, '0');
              final seconds = (_.secondsRemaining % 60).toString().padLeft(2, '0');
              return Text("Resend code in $minutes:$seconds",
                  style: const TextStyle(color: Colors.grey));
            }),
            GetBuilder<OtpController>(builder: (_) {
              return TextButton(
                onPressed: _.canResend ? _.resendCode : null,
                child: const Text("Resend Code"),
              );
            }),
            const Spacer(),
            Obx(() => SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.otpCode.value.length == 6
                    ? controller.verifyOtp
                    : null,
                child: const Text("Verify"),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
