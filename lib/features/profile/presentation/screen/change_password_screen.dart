import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_submit_button.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/common/widgets/custom_text_field.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';
import 'package:shuroo/features/profile/controller/change_password_controller.dart';
import 'package:shuroo/features/profile/controller/profile_information_controller.dart';
import 'package:shuroo/features/profile/presentation/widget/custom_back_header.dart';
import 'package:shuroo/features/profile/presentation/widget/custom_information_texformfield.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customBackHeader("Change Password", 82),
                SizedBox(height: 16.h,),

                Obx(() =>
                    customInformationTFFiled(
                        "Current Password", "Enter Password",
                        controller.currentTEController,
                        GestureDetector(
                            onTap: (){
                              controller.currentVisibility.value = !controller.currentVisibility.value;
                            },
                            child: controller.currentVisibility.value ?
                            Icon(Icons.visibility_outlined) : Icon(Icons.visibility_off_outlined)
                        ),
                        controller.currentVisibility.value
                    )
                ),
                Obx(() =>
                    customInformationTFFiled("New Password", "Enter Password", controller.newTEController,
                        GestureDetector(
                            onTap: (){
                              controller.newVisibility.value = !controller.newVisibility.value;
                            },
                            child: controller.newVisibility.value ?
                            Icon(Icons.visibility_outlined) : Icon(Icons.visibility_off_outlined)
                        ),
                        controller.newVisibility.value
                    ),
                ),
                Obx(() =>
                    customInformationTFFiled("Confirm Password", "Enter Password", controller.confirmTEController,
                        GestureDetector(
                            onTap: (){
                              controller.confirmVisibility.value = !controller.confirmVisibility.value;
                            },
                            child: controller.confirmVisibility.value ?
                            Icon(Icons.visibility_outlined) : Icon(Icons.visibility_off_outlined)
                        ),
                        controller.confirmVisibility.value
                    ),
                ),

                SizedBox(height: 24.h,),
                CustomSubmitButton(
                  text: "Change Password",
                  onTap: (){
                    Get.back();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
