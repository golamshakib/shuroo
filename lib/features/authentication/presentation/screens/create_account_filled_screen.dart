import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:password_strength_indicator_plus/password_strength_indicator_plus.dart';
import 'package:shuroo/core/common/widgets/custom_password_textform_field.dart';
import 'package:shuroo/core/common/widgets/custom_submit_button.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/routes/app_routes.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_textform_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../controllers/create_account_filled_screen_controller.dart';


class CreateAccountFilledScreen extends StatelessWidget {
  CreateAccountFilledScreen({super.key});

  final FilledScreenController _controller = Get.put(FilledScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Container(
              margin: EdgeInsets.only(left: 16, top: 20, right: 16),
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back, size: 24)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Image.asset(ImagePath.logo, height: 62.w, width: 62.w),
                        SizedBox(height: 12),
                        CustomText(text: AppText.create_account, fontSize: 24),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 32),
                    child: CustomTextFormField(
                      controller: _controller.nameController,
                      label: "Name",
                      hintText: AppText.enterYourName,
                      fontFamily: 'Inter',
                      icon: IconPath.prame,
                      hintSize: 16,
                    ),
                  ),
                  // SizedBox(height: 24,),

                  Container(
                    margin: EdgeInsets.only(top: 24.h),
                    child: CustomTextFormField(
                      controller: _controller.emailController,
                      label: "Email",
                      hintText: AppText.hint_rochellebackman,
                      fontFamily: 'Inter',
                      hintSize: 16,
                      icon: IconPath.email,
                    ),
                  ),
                  // SizedBox(height: 24,),
                  Container(
                    margin: EdgeInsets.only(top: 24.h),
                    child: CustomTextFormField(
                      controller: _controller.phoneController,
                      label: "Phone",
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      hintText: "+1",
                      keyboardType: TextInputType.phone,
                      fontFamily: 'Inter',
                      hintSize: 16,
                      icon: IconPath.phoneIcon,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 24.h, bottom: 10.w),
                    child: CustomTextFormFieldPass(
                      onChanged: (qw) {
                        _controller.getValidator(qw);
                      },
                      controller: _controller.passController,
                      label: AppText.createPassword,
                      hintText: AppText.hintPassword,
                      icon: IconPath.eye,
                      fontFamily: 'Inter',
                      hintSize: 16,
                    ),
                  ),

                  Obx(() => _controller.isCheckd.value == true
                      ? Transform.scale(
                          scaleY: 1.5,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.zero,
                            child: PasswordStrengthIndicatorPlus(

                              textController: _controller.indicatorController,
                              maxLength: 18,
                              minLength: 6,
                              successIcon: Icons.check_circle,
                              unSuccessIcon: Icons.cancel,
                              successWidget: const Icon(Icons.check_circle,
                                  color: Colors.green),
                              unSuccessWidget:
                                  const Icon(Icons.cancel, color: Colors.red),
                              textSize: 16,
                              hideRules: true,
                            ),
                          ),
                        )
                      : SizedBox()),

                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text.rich(
                      TextSpan(
                        text: AppText.passwordstrengthWeak,
                        style: const TextStyle(
                            color: AppColors.textPrimary, fontSize: 14),
                        children: [
                          TextSpan(
                            text: AppText.trylengtheningit,
                            style: TextStyle(
                                color: AppColors.textSecondary, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),


                  Container(
                    margin: EdgeInsets.only(top: 68,bottom: 20),
                    child: Text.rich(
                      TextSpan(
                        text: AppText.byproceeding,
                        style: const TextStyle(
                            color: AppColors.textSecondary, fontSize: 14),
                        children: [
                          TextSpan(
                            text: AppText.termsConditions,
                            style: TextStyle(
                                color: AppColors.textPrimary, fontSize: 14),


                            recognizer:  TapGestureRecognizer()
                              ..onTap =
                                  () =>
                                  Get.toNamed(AppRoute.termsAndConditionsScreen),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomSubmitButton(
                    text: AppText.create_account,
                    onTap: () {
                      log("I am nifat");
                      _controller.requestToCreateAccount();
                    },
                    color: AppColors.custom_blue,
                    borderRadius: BorderRadius.circular(50),
                    fontSize: 15.sp,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.w, bottom: 28.h),

                    child: RichText(
                      text: TextSpan(
                        text: AppText.already_have_an_account,
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14.sp,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: AppText.sign_in,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.custom_blue,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                            ),
                            recognizer:
                            TapGestureRecognizer()
                              ..onTap =
                                  () =>
                                  Get.toNamed(AppRoute.signInAndUnlockScreen),
                          ),
                        ],
                      ),),
                  ),
                ]),
              ))),
    ));
  }
}
