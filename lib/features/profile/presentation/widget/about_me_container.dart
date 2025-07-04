import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/profile/controller/personal_creation_controller.dart';
import 'package:shuroo/features/profile/controller/profile_information_controller.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../core/utils/constants/image_path.dart';

Widget aboutMeContainer(PersonalCreationController controller) {
  final controllerOne = Get.find<ProfileInformationController>();

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.sp),
      color: AppColors.white,
    ),
    padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h, bottom: 8.h),
    child: Obx(() {
      final user = controllerOne.userProfile.value.data;

      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 125.h,
                width: 110.w,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(9.sp),
                    child: Obx(() => controller.profilePath.value == ''
                        ? Image.asset(
                            user?.image ?? ImagePath.dummyProfilePicture,
                            height: 104.h,
                            width: 86.w,
                            fit: BoxFit.fill,
                          )
                        : Image.file(
                            File(controller.profilePath.value),
                            height: 104.h,
                            width: 86.w,
                            fit: BoxFit.fill,
                          )),
                  ),
                ),
              ),
              Positioned(
                top: -1,
                right: 2,
                child: GestureDetector(
                  onTap: () {
                    print("I am here clicking");
                    controller.pickProfile();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF01A8F9),
                      border: Border.all(color: AppColors.white),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                    child: Icon(
                      Icons.add,
                      color: AppColors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 12.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: user?.name ?? 'User Name',
                fontSize: 18.sp,
              ),
              SizedBox(
                height: 4.5.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(IconPath.homeIcon),
                  SizedBox(
                    width: 1.w,
                  ),
                  CustomText(
                    text: 'Brookfield University',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  )
                ],
              ),
              SizedBox(
                height: 14.5.w,
              ),
              CustomText(
                text: "Major",
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
              CustomText(
                text: 'Brookfield University',
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ],
          )
        ],
      );
    }),
  );
}
