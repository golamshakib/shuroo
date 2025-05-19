import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shuroo/core/common/widgets/app_color.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/authentication/presentation/screens/sign_up_verification_code_screen.dart';
import 'package:shuroo/routes/app_routes.dart';

import '../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_textform_field.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../controllers/forgot_password_screen_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final ForgotPasswordController _controller = Get.put(
      ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                margin: EdgeInsets.only(left: 16.w, top: 20.h, right: 16.w),
                child: SingleChildScrollView(
                    child: Column(children: [
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
                            Image.asset(
                                ImagePath.logo, height: 62.w, width: 62.w),
                            SizedBox(height: 12),
                            CustomText(
                                text: AppText.forgotPassword, fontSize: 24),


                            Container(
                              margin: EdgeInsets.only(top: 12),
                              child: CustomText(
                                text: AppText.enterYourEmailAccount,
                                fontSize: 14,
                                color: AppColors.dark75,)
                              ,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 40.h),
                              child: CustomTextFormField(
                                controller: _controller.emailController,
                                label: AppText.email,
                                hintText: AppText.enterYourEmail,
                                fontFamily: 'Inter',
                                hintColor: AppColors.grayText,
                                hintSize: 16,
                                icon: IconPath.email,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 396),
                              child: CustomSubmitButton(
                                text: AppText.continueB, onTap: () {
                                Get.toNamed(
                                    AppRoute.signInVeryficationCodeScreen);
                              },),
                            )
                            // S

                          ],
                        ),
                      ),


                    ],)
                )
            )));
  }
}
