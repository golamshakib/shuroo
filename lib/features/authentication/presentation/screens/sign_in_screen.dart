import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/features/authentication/controllers/sign_in_screen_controller.dart';

import '../../../../core/common/widgets/custom_password_textform_field.dart';
import '../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_textform_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../../../routes/app_routes.dart';
import '../../controllers/create_account_filled_screen_controller.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final SignInScreenController _controller = Get.put(SignInScreenController());

  @override
  Widget build(BuildContext context) {
    print("........SignInScreen");
    return Scaffold(
        body: SafeArea(
            child: Container(
                margin: EdgeInsets.only(left: 16.w, top: 20.h, right: 16.w),
                child: SingleChildScrollView(
                    child: Column(children: [
                  Container(
                      margin: EdgeInsets.only(top: 5.h),
                      alignment: Alignment.topCenter,
                      child: Column(children: [
                        Image.asset(ImagePath.logo, height: 62.w, width: 62.w),
                        SizedBox(height: 12),
                        CustomText(text: AppText.sign_in, fontSize: 24.sp),
                        CustomTextFormField(
                          controller: _controller.emailController,

                          label: AppText.emailIID,
                          hintSize: 16,
                          hintColor: AppColors.textPrimary,
                          hintText: AppText.hint_rochellebackman,
                          icon: IconPath.email,
                          fontFamily: 'Inter',
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 24.h,
                          ),
                          child: CustomTextFormFieldPass(
                            onChanged: (qw) {},
                            controller: _controller.passController,
                            label: AppText.createPassword,
                            hintText: AppText.hintPassword,
                            icon: IconPath.eye,
                            fontFamily: 'Inter',
                            hintColor: AppColors.textPrimary,
                            hintSize: 16,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() => _controller
                                          .isCheckemailAndPassword.value ==
                                      true
                                  ? Row(
                                      children: [
                                        Checkbox(
                                          value: _controller.isChecked.value,
                                          onChanged: (value) => _controller
                                              .toggleCheckbox(value!),
                                        ),
                                        Text(
                                          AppText.remember_me,
                                          style: TextStyle(
                                              fontFamily: "inter",
                                              fontSize: 14.sp,
                                              color: AppColors.grayText),
                                        )
                                      ],
                                    )
                                  : Row(
                                    children: [
                                      Image.asset(IconPath.wrong,height: 16.h,width: 16.w,),
                                      CustomText(
                                          text: " "+AppText.WrongEmailAndPass,color: Colors.red,fontSize: 14,),
                                    ],
                                  )),

                              InkWell(
                                onTap: (){

                                  print("........forgotPasswordScreen");

                                  Get.toNamed(AppRoute.forgotPasswordScreen);
                                },
                                child: Text(
                                  AppText.forgotPassword,
                                  style: TextStyle(
                                      fontSize: 14.sp, fontFamily: "inter"),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 269),
                          child: CustomSubmitButton(
                            text: AppText.sign_in,
                            onTap: ()async {
                             await _controller.emailAndPasswordvalidatorCheck();
                              if (!_controller.isCheckemailAndPassword.value) {
                                Get.toNamed(AppRoute.nevBar);
                              }
                            },
                            color: AppColors.custom_blue,
                            borderRadius: BorderRadius.circular(50),
                            fontSize: 15.sp,
                          ),
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
                                  text: AppText.signUp,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.custom_blue,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Get.toNamed(
                                         AppRoute.signUpScreen

                                    ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]))
                ])))));
  }
}
