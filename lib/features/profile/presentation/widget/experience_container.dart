import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';
import 'package:shuroo/features/profile/controller/personal_creation_controller.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';

Widget experienceContainer(
    PersonalCreationController controller, BuildContext context) {
  return Obx(() => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.h), color: AppColors.white),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...(controller.userProfile.value.data?.experience?.isNotEmpty ==
                    true
                ? controller.userProfile.value.data!.experience!
                    .map((row) => Padding(
                          padding: EdgeInsets.only(bottom: 32.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                ImagePath.dummyExperience,
                                height: 28.h,
                                width: 28.w,
                                fit: BoxFit.fill,
                                color: AppColors.primary,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 265.w,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: row.company ?? '',
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        if (controller.experienceEdit.value)
                                          GestureDetector(
                                            onTap: () {
                                              controller.deleteExperience(
                                                  row.id.toString());
                                            },
                                            child: CustomText(
                                              text: "Delete",
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.red,
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                  CustomText(
                                    text: row.title ?? '',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  CustomText(
                                    text:
                                        "${row.startDate.toString()} - ${row.endDate.toString()}",
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textSecondary,
                                  ),
                                  SizedBox(
                                    height: 14.h,
                                  ),
                                  SizedBox(
                                    width: 265.w,
                                    child: CustomText(
                                      text: row.description ?? '',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ))
                    .toList()
                : <Widget>[]),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0xFFE6F6FE),
                side: BorderSide.none,
                padding: EdgeInsets.symmetric(vertical: 14.h),
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: AppColors.primaryBackground,
                    builder: (context) {
                      return Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: SingleChildScrollView(child: 
                      Padding(padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 16.h),child: 
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Add Experience",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                CustomTextField(
                                    controller: controller.titleTEController,
                                    hintText: "Title",
                                    radius: 12),
                                SizedBox(
                                  height: 8.h,
                                ),
                                CustomTextField(
                                    controller:
                                        controller.companyNameTEController,
                                    hintText: "Company",
                                    radius: 12),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: CustomTextField(
                                        controller: controller
                                            .startExperienceTEController,
                                        hintText: "Start Year",
                                        radius: 12,
                                        inputFormat: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: CustomTextField(
                                          controller: controller
                                              .endExperienceTEController,
                                          hintText: "End Year",
                                          inputFormat: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          radius: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                CustomTextField(
                                  controller: controller.describeTEController,
                                  hintText: "Describe this experience",
                                  radius: 12,
                                  maxLine: 3,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: AppColors.customBlue,
                                    side: BorderSide.none,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 14.h),
                                  ),
                                  onPressed: () {
                                    controller.experienceAdd();
                                    Get.back();
                                    print('Experience added');
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText(
                                        text: "Save",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.sp,
                                        color: AppColors.white,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: AppColors.customBlue,
                    size: 20.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CustomText(
                    text: "Experience",
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: AppColors.customBlue,
                  )
                ],
              ),
            )
          ],
        ),
      ));
}
