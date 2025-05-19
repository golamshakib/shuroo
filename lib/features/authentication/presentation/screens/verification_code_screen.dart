import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

import '../../controllers/signup_veritication_screen_controller.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final controller = Get.put(SingUpVerificationController());
  final List<TextEditingController> otpFields =
  List.generate(6, (_) => TextEditingController());

  void _handleOtpInput(int index, String value, BuildContext context) {
    if (value.isNotEmpty && index < 5) {
      FocusScope.of(context).nextFocus();
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus();
    }
  }

  String get enteredOtp =>
      otpFields.map((controller) => controller.text).join();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("OTP Verification")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text("Enter the 6-digit OTP sent to your phone"),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (i) {
                return SizedBox(
                  width: 45,
                  child: TextField(
                    controller: otpFields[i],
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) =>
                        _handleOtpInput(i, value, context),
                    decoration: const InputDecoration(counterText: ''),
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),
            Obx(() => Text(
              "Resend code in ${controller.formattedTime}",
              style: const TextStyle(color: Colors.grey),
            )),
            Obx(() => TextButton(
              onPressed: controller.isTimerRunning
                  ? null
                  : controller.resendCode,
              child: const Text("Resend Code"),
            )),
            const Spacer(),
            Obx(() => SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: enteredOtp.length == 6
                    ? () => controller.verifyOtp(enteredOtp)
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
