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
import 'package:shuroo/features/profile/controller/personal_creation_controller.dart';
import 'package:shuroo/features/profile/controller/profile_information_controller.dart';
import 'package:shuroo/features/profile/presentation/widget/about_me_container.dart';
import 'package:shuroo/features/profile/presentation/widget/custom_back_header.dart';
import 'package:shuroo/features/profile/presentation/widget/custom_information_texformfield.dart';
import 'package:shuroo/features/profile/presentation/widget/education_container.dart';
import 'package:shuroo/features/profile/presentation/widget/experience_container.dart';

class PersonalCreationScreen extends GetView<PersonalCreationController> {
  const PersonalCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: Colors.white,
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back_outlined),
                        ),
                        SizedBox(width: 85.w,),
                        CustomText(text: "Personal Creation", fontSize: 20.sp,)
                      ],
                    ),
                  ),
                ),
              ),
              /// Body Part
              
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "About Me", color: AppColors.textSecondary, fontSize: 16.sp,),
                    SizedBox(height: 12.h,),
                    aboutMeContainer(controller),
                    SizedBox(height: 16.h,),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        side: BorderSide.none,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                      ),
                      onPressed: (){
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: Colors.black, size: 20.h,),
                          CustomText(text: "Video Profile", fontWeight: FontWeight.w500, fontSize: 15.sp,)
                        ],
                      ),
                    ),
                    SizedBox(height: 28.h,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: "Education", color: AppColors.textSecondary, fontSize: 16.sp,),
                        GestureDetector(
                          onTap: (){
                            controller.educationEdit.value = true;
                          },
                          child: CustomText(text: "Edit", color: AppColors.customBlue, fontSize: 16.sp,),
                        )
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    educationContainer(controller),
                    SizedBox(height: 28.h,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: "Experience", color: AppColors.textSecondary, fontSize: 16.sp,),
                        GestureDetector(
                          onTap: (){
                            controller.experienceEdit.value = true;
                          },
                          child: CustomText(text: "Edit", color: AppColors.customBlue, fontSize: 16.sp,),
                        )
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    experienceContainer(controller),
                    SizedBox(height: 28.h,),
                    CustomText(text: "About", color: AppColors.textSecondary, fontSize: 16.sp,),
                    SizedBox(height: 12.h,),
                    CustomTextField(
                      controller: controller.aboutTEController,
                      hintText: "Write here",
                      maxLine: 4,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
