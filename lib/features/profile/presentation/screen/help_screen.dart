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

class HelpScreen extends GetView<ProfileInformationController> {
  const HelpScreen({super.key});

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
                customBackHeader("Help & Support", 95),
                SizedBox(height: 16.h,),
                CustomText(text: controller.helpMessage, fontWeight: FontWeight.w400, fontSize: 16.sp,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
