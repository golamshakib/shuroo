import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import '../../../../core/common/widgets/custom_password_textform_field.dart';
import '../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../../../routes/app_routes.dart';
import '../../controllers/reset_password_screen_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final ResetPasswordScreenController _controller = Get.put(
      ResetPasswordScreenController());

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
                                text: AppText.resetPassword, fontSize: 24),


                            Container(
                              margin: EdgeInsets.only(top: 12),
                              child: CustomText(
                                text: AppText.setYourNewPassword,
                                fontSize: 14,
                                color: AppColors.dark75,)
                              ,
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 24),
                              child: CustomTextFormFieldPass(
                                onChanged: (qw) {},
                                controller: _controller.newPassController,
                                label: AppText.newPassword,
                                hintText: AppText.hintPassword,
                                icon: IconPath.eye,
                                fontFamily: 'Inter',
                                hintColor: AppColors.textPrimary,
                                hintSize: 16,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 24),
                              child: CustomTextFormFieldPass(
                                onChanged: (qw) {},
                                controller: _controller.confirmPassController,
                                label: AppText.confirmPassword,
                                hintText: AppText.hintPassword,
                                icon: IconPath.eye,
                                fontFamily: 'Inter',
                                hintColor: AppColors.textPrimary,
                                hintSize: 16,
                              ),
                            ),


                            Container(
                              margin: EdgeInsets.only(top: 293),
                              child: CustomSubmitButton(
                                text: AppText.changePassword, onTap: () {
                                Get.toNamed(
                                    AppRoute.signInScreen);
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
