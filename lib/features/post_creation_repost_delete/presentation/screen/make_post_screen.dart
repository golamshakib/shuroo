import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_submit_button.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/common/widgets/custom_text_field.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/app_texts.dart';
import 'package:shuroo/features/post_creation_repost_delete/controller/make_post_controller.dart';
import 'package:shuroo/routes/app_routes.dart';
import '../../../../core/utils/constants/icon_path.dart';

class MakePostScreen extends StatelessWidget {
  MakePostScreen({super.key});

  final controller = Get.put(MakePostController());

  @override
  Widget build(BuildContext context) {
    controller.textController.addListener(() {
      controller.isNotEmpty.value = controller.textController.text.isNotEmpty;
    });

    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryBackground,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    IconPath.cancle,
                    height: 40,
                    width: 40,
                  ),
                ),
                Image.asset(
                  IconPath.icon_pro,
                  height: 40,
                  width: 40,
                ),
                SizedBox(width: 10),
                CustomText(
                  text: AppText.rochelle,
                  fontSize: 18,
                  color: AppColors.textPrimary,
                )
              ],
            ),
            Obx(() => InkWell(
                  onTap: controller.isNotEmpty.value
                      ? () {
                          Get.back();
                          Get.snackbar(
                              'Your Post', 'Your Post Created Successfully');
                        }
                      : null,
                  child: Container(
                    width: 72.0.w,
                    height: 40.0.h,
                    decoration: BoxDecoration(
                      color: controller.isNotEmpty.value
                          ? Colors.blue
                          : Color(0xFFE6E6E7),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Center(
                      child: CustomText(
                        text: AppText.post,
                        color: controller.isNotEmpty.value
                            ? Colors.white
                            : AppColors.grayText,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.primaryBackground,
                border: Border.all(color: Colors.transparent)),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                SizedBox(
                    height: 100.w,
                    child: CustomTextField(
                        focusBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        enableBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        maxLine: 3,
                        borderColor: Colors.transparent,
                        fillColor: Colors.transparent,
                        controller: controller.textController,
                        hintText: "Share your thoughts...")),
                Obx(() => controller.imagePath.value != ""
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                  onPressed: () {
                                    controller.imagePath.value = "";
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Color(0xffE6E6E7),
                                    size: 32,
                                  ))),
                          SizedBox(
                            width: double.infinity,
                            height: 365.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                File(controller.imagePath.value),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                        ],
                      )
                    : SizedBox.shrink())
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
          decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              border: Border.all(color: Colors.transparent)),
          margin: EdgeInsets.only(left: 15, bottom: 12),
          child: GestureDetector(
            onTap: () {
              controller.pickImage();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  IconPath.gallery,
                  height: 24.w,
                  width: 24.w,
                ),
                SizedBox(width: 8.w),
                CustomText(
                  text: AppText.add_photos_video,
                  fontSize: 14,
                  color: Color(0xFF353A40),
                )
              ],
            ),
          )),
    );
  }
}
