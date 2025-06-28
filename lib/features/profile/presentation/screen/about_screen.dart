import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/profile/controller/profile_information_controller.dart';
import 'package:shuroo/features/profile/presentation/widget/custom_back_header.dart';

class AboutScreen extends GetView<ProfileInformationController> {
  const AboutScreen({super.key});

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
                customBackHeader("About", 130),
                SizedBox(height: 16.h,),
                CustomText(text: controller.aboutMessage, fontWeight: FontWeight.w400, fontSize: 16.sp,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
