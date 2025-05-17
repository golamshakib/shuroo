import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shuroo/core/common/widgets/app_color.dart';
import 'package:shuroo/core/common/widgets/custom_submit_button.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/routes/app_routes.dart';

import '../../../../core/common/widgets/custom_password_textform_field.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_textform_field.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../controllers/create_account_default_controller.dart';
import '../../controllers/login_controller.dart';
import 'create_account_filled_screen.dart';

class CreateAccountDefaultScreen extends StatelessWidget {
  CreateAccountDefaultScreen({super.key});

  final DefaultController controller = Get.put(DefaultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
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
                        controller: controller.nameController,
                        label: AppText.name,
                        hintText: AppText.enterYourName,
                        icon: IconPath.prame,
                      ),
                    ),
                    // SizedBox(height: 24,),

                    Container(
                      margin: EdgeInsets.only(top: 24.h),
                      child: CustomTextFormField(
                        controller: controller.emailController,
                        label: AppText.emailIdPhoneNumber,
                        hintText: AppText.enterYourEmailIdOrPhoneNumber,
                        icon: null,
                      ),
                    ),
                    // SizedBox(height: 24,),

                    Container(
                      margin: EdgeInsets.only(top: 24.h),
                      child: CustomTextFormFieldPass(
                        controller: controller.passController,
                        label: AppText.createPassword,
                        hintText: AppText.enterPassword,
                        icon: IconPath.eye,
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 28),
                      child: CustomText(
                        text: AppText.password_must,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 69, bottom: 20),
                      child:
                      Text.rich(
                        TextSpan(
                          text: AppText.byproceeding,
                          style: const TextStyle(
                              color: AppColors.textSecondary, fontSize: 14),
                          children: [
                            TextSpan(
                              text: AppText.termsConditions,
                              style: TextStyle(
                                  color: AppColors.textPrimary, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),

                    CustomSubmitButton(
                      text: AppText.create_account,
                      onTap: () {
                        Get.toNamed(AppRoute.createAccountFilledScreen);
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
                              text: "Sign In",
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
                ))));
  }
}
