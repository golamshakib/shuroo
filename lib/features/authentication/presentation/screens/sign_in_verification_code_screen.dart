import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import '../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../controllers/signin_verification_screen_controller.dart';

class SignInVeryficationCodeScreen extends StatelessWidget {
  SignInVeryficationCodeScreen({super.key});

  final controller = Get.put(SignInVerificationScreenController());
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
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 16.w, top: 20.h, right: 16.w),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back, size: 24.sp)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Image.asset(ImagePath.logo, height: 62.w, width: 62.w),
                        SizedBox(height: 12),
                        CustomText(text: AppText.enterYourEmail, fontSize: 24),
                        Container(
                          margin: EdgeInsets.only(top: 12.w, bottom: 40.h),
                          child: RichText(
                            text: TextSpan(
                              text: "We have sent a code to",
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 14.sp,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: " your email address",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.textSecondary,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Pinput(
                          controller: controller.pinTEController,
                          length: 6,
                          defaultPinTheme: PinTheme(
                            width: 56,
                            height: 56,
                            textStyle: GoogleFonts.cabin(
                                decorationColor: const Color(0xff2972FF),
                                fontSize: 14.sp,
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w600),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onCompleted: (v) {
                            controller.active.value = true;
                          },
                          onTapOutside: (v) {
                            FocusScope.of(context).unfocus();
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 34),
                          child: Text(
                            " ${controller.formattedTime}s",
                            style: const TextStyle(
                                color: AppColors.textPrimary,
                                fontFamily: "cabin"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 300.w, bottom: 24.h),
                          child: RichText(
                            text: TextSpan(
                              text: AppText.didntreceiveacode,
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 14.sp,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: AppText.resendCode,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.textPrimary,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Obx(() => controller.active.value
                            ? CustomSubmitButton(
                                text: AppText.verify,
                                onTap: () {
                                  controller.verifyOtp();
                                },
                              )
                            : CustomSubmitButton(
                                color: AppColors.custom_blue.withAlpha(100),
                                text: AppText.verify,
                                onTap: () {},
                              ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
