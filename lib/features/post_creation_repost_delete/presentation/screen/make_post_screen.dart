import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/common/widgets/custom_text_field.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/app_texts.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';
import 'package:shuroo/features/post_creation_repost_delete/controller/make_post_controller.dart';
import 'package:shuroo/features/profile/controller/profile_information_controller.dart';
import 'package:shuroo/routes/app_routes.dart';
import '../../../../core/utils/constants/icon_path.dart';

class MakePostScreen extends StatelessWidget {
  MakePostScreen({super.key});

  final controller = Get.find<MakePostController>();
  final controllerOne = Get.find<ProfileInformationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(context),
      bottomSheet: _buildBottomSheet(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                maxLine: 4,
                controller: controller.textController,
                hintText: "Share your thoughts...",
                fillColor: AppColors.white,
                showBorder: false,
              ),
              SizedBox(height: 50.h),
              Obx(() {
                if (controller.picUploads.isEmpty) return SizedBox.shrink();

                return Column(
                  children: List.generate(
                    controller.picUploads.length,
                    (index) {
                      final imagePath = controller.picUploads[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                File(imagePath),
                                height: 365.h,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Material(
                                color: Colors.transparent,
                                shape: CircleBorder(),
                                child: InkWell(
                                  customBorder: CircleBorder(),
                                  onTap: () {
                                    controller.picUploads.removeAt(index);
                                    print("It's Clicked");
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() {
            final user = controllerOne.userProfile.value.data;

            return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoute.myAllPostScreen);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Image.asset(
                            IconPath.cancle,
                            height: 40.w,
                            width: 40.w,
                          ),
                        ),
                        SizedBox(width: 10.w),

                        // Profile Image
                        if (user?.image != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              user!.image,
                              height: 40.w,
                              width: 40.w,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.person, size: 24),
                            ),
                          )
                        else
                          CircleAvatar(
                              radius: 20.w,
                              child:
                                  Image.asset(ImagePath.dummyProfilePicture)),

                        SizedBox(width: 10.w),

                        // User Name
                        CustomText(
                          text: user?.name ?? 'User Name',
                          fontSize: 18.sp,
                          color: AppColors.textPrimary,
                        ),
                      ],
                    ),
                  ],
                ));
          }),
          GestureDetector(
            onTap: () {
              controller.createPost(
                postText: controller.textController.text,
              );
              Get.back();
            },
            child: Container(
              width: 72.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: const Color(0xFFE6E6E7),
                borderRadius: BorderRadius.circular(50),
              ),
              alignment: Alignment.center,
              child: CustomText(
                text: AppText.post,
                color: AppColors.grayText,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheet() {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      margin: EdgeInsets.only(left: 15.w, bottom: 12.h),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: controller.pickImages,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
            child: Row(
              children: [
                SvgPicture.asset(
                  IconPath.gallery,
                  height: 24.w,
                  width: 24.w,
                ),
                SizedBox(width: 8.w),
                CustomText(
                  text: AppText.add_photos_video,
                  fontSize: 14.sp,
                  color: const Color(0xFF353A40),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
