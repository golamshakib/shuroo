import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_submit_button.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/features/profile/controller/profile_information_controller.dart';
import 'package:shuroo/features/profile/presentation/widget/custom_back_header.dart';
import 'package:shuroo/features/profile/presentation/widget/custom_information_texformfield.dart';

class ProfileInformationScreen extends GetView<ProfileInformationController> {
  const ProfileInformationScreen({super.key});

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
                customBackHeader("My Profile", 115),
                SizedBox(height: 16.h,),

                customInformationTFFiled("Name", "Enter your full name", controller.nameTEController, Image.asset(IconPath.dummyPersonIcon), true),
                customInformationTFFiled("Email", "Enter your email address", controller.emailTEController, Image.asset(IconPath.dummyEmailIcon), true),
                customInformationTFFiled("Phone", "Enter your number", controller.phoneTEController, Image.asset(IconPath.phoneIcon), true),
                customInformationTFFiled("Country", "Enter your country", controller.countryTEController, null, true),
                customInformationTFFiled("State", "Enter your state", controller.stateTEController, null, true),
                customInformationTFFiled("City", "Enter your city", controller.cityTEController, null, true),
                SizedBox(height: 24.h,),
                CustomSubmitButton(
                  text: "Save",
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
