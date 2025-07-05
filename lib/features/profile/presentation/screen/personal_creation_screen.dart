import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/common/widgets/custom_text_field.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/profile/controller/personal_creation_controller.dart';
import 'package:shuroo/features/profile/presentation/widget/about_me_container.dart';
import 'package:shuroo/features/profile/presentation/widget/education_container.dart';
import 'package:shuroo/features/profile/presentation/widget/experience_container.dart';
import 'package:shuroo/features/profile/presentation/widget/short_container.dart';

class PersonalCreationScreen extends GetView<PersonalCreationController> {
  const PersonalCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
          top: false,
          child: RefreshIndicator(
            onRefresh: controller.refreshProfile,
            backgroundColor: AppColors.custom_blue,
            color: AppColors.textWhite,
            displacement: 50,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(Icons.arrow_back_outlined),
                            ),
                            SizedBox(
                              width: 85.w,
                            ),
                            CustomText(
                              text: "Personal Creation",
                              fontSize: 20.sp,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// Body Part

                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "About Me",
                          color: AppColors.textSecondary,
                          fontSize: 16.sp,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        aboutMeContainer(controller),
                        // SizedBox(
                        //   height: 16.h,
                        // ),
                        // OutlinedButton(
                        //   style: OutlinedButton.styleFrom(
                        //     backgroundColor: AppColors.white,
                        //     side: BorderSide.none,
                        //     padding: EdgeInsets.symmetric(vertical: 14.h),
                        //   ),
                        //   onPressed: () {},
                        //   child: Row(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Icon(
                        //         Icons.add,
                        //         color: Colors.black,
                        //         size: 20.h,
                        //       ),
                        //       CustomText(
                        //         text: "Video Profile",
                        //         fontWeight: FontWeight.w500,
                        //         fontSize: 15.sp,
                        //       )
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: 28.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Education",
                              color: AppColors.textSecondary,
                              fontSize: 16.sp,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.educationEdit.value = true;
                              },
                              child: CustomText(
                                text: "Edit",
                                color: AppColors.customBlue,
                                fontSize: 16.sp,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        educationContainer(controller, context),
                        SizedBox(
                          height: 28.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Experience",
                              color: AppColors.textSecondary,
                              fontSize: 16.sp,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.experienceEdit.value = true;
                              },
                              child: CustomText(
                                text: "Edit",
                                color: AppColors.customBlue,
                                fontSize: 16.sp,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        experienceContainer(controller, context),
                        SizedBox(
                          height: 28.h,
                        ),
                        CustomText(
                          text: "About",
                          color: AppColors.textSecondary,
                          fontSize: 16.sp,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        CustomTextField(
                          controller: controller.aboutTEController,
                          hintText: "Write here",
                          maxLine: 3,
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Skills",
                              color: AppColors.textSecondary,
                              fontSize: 16.sp,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.skillEdit.value = true;
                              },
                              child: CustomText(
                                text: "Edit",
                                color: AppColors.customBlue,
                                fontSize: 16.sp,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Obx(() => Wrap(
                              direction: Axis.horizontal,
                              spacing: 8.w,
                              runSpacing: 8.h,
                              children: [
                                ...controller.skillList.map((element) =>
                                    shortContainer(
                                        element,
                                        controller,
                                        controller.skillList,
                                        controller.skillEdit)),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        backgroundColor:
                                            AppColors.primaryBackground,
                                        builder: (context) {
                                          return SizedBox(
                                            width: double.infinity,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 13.w,
                                                  vertical: 16.h),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                      text: "Add Skill",
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    CustomTextField(
                                                        controller: controller
                                                            .skillTEController,
                                                        hintText: "Type here",
                                                        radius: 12),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    OutlinedButton(
                                                      style: OutlinedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            AppColors
                                                                .customBlue,
                                                        side: BorderSide.none,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 14.h),
                                                      ),
                                                      onPressed: () {
                                                        controller.addSkill();
                                                        Get.back();
                                                      },
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          CustomText(
                                                            text: "Save",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 15.sp,
                                                            color:
                                                                AppColors.white,
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
                                  child: Container(
                                    width: 75.w,
                                    margin: EdgeInsets.only(top: 8.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(999),
                                      color: Color(0xFFE6F6FE),
                                      border: Border(),
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: AppColors.customBlue,
                                          size: 20.h,
                                        ),
                                        CustomText(
                                          text: "New",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          color: AppColors.customBlue,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),

                        /// Add tools
                        SizedBox(
                          height: 28.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Tools",
                              color: AppColors.textSecondary,
                              fontSize: 16.sp,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.toolsEdit.value = true;
                              },
                              child: CustomText(
                                text: "Edit",
                                color: AppColors.customBlue,
                                fontSize: 16.sp,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Obx(() => Wrap(
                              direction: Axis.horizontal,
                              spacing: 8.w,
                              runSpacing: 8.h,
                              children: [
                                ...controller.toolsList.map((element) =>
                                    shortContainer(
                                        element,
                                        controller,
                                        controller.toolsList,
                                        controller.toolsEdit)),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        backgroundColor:
                                            AppColors.primaryBackground,
                                        builder: (context) {
                                          return SizedBox(
                                            width: double.infinity,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 13.w,
                                                  vertical: 16.h),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                      text: "Add Tools",
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    CustomTextField(
                                                        controller: controller
                                                            .technologyTEController,
                                                        hintText: "Type here",
                                                        radius: 12),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    OutlinedButton(
                                                      style: OutlinedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            AppColors
                                                                .customBlue,
                                                        side: BorderSide.none,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 14.h),
                                                      ),
                                                      onPressed: () {
                                                        controller
                                                            .addTechnology();
                                                        Get.back();
                                                      },
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          CustomText(
                                                            text: "Save",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 15.sp,
                                                            color:
                                                                AppColors.white,
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
                                  child: Container(
                                    width: 75.w,
                                    margin: EdgeInsets.only(top: 8.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(999),
                                      color: Color(0xFFE6F6FE),
                                      border: Border(),
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: AppColors.customBlue,
                                          size: 20.h,
                                        ),
                                        CustomText(
                                          text: "New",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          color: AppColors.customBlue,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),

                        /// Add interest
                        SizedBox(
                          height: 28.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Interest",
                              color: AppColors.textSecondary,
                              fontSize: 16.sp,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.interestEdit.value = true;
                              },
                              child: CustomText(
                                text: "Edit",
                                color: AppColors.customBlue,
                                fontSize: 16.sp,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Obx(() => Wrap(
                              direction: Axis.horizontal,
                              spacing: 8.w,
                              runSpacing: 8.h,
                              children: [
                                ...controller.interestList.map((element) =>
                                    shortContainer(
                                        element,
                                        controller,
                                        controller.interestList,
                                        controller.interestEdit)),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        backgroundColor:
                                            AppColors.primaryBackground,
                                        builder: (context) {
                                          return SizedBox(
                                            width: double.infinity,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 13.w,
                                                  vertical: 16.h),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                      text: "Add Interest",
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    CustomTextField(
                                                        controller: controller
                                                            .interestTEController,
                                                        hintText: "Type here",
                                                        radius: 12),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    OutlinedButton(
                                                      style: OutlinedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            AppColors
                                                                .customBlue,
                                                        side: BorderSide.none,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 14.h),
                                                      ),
                                                      onPressed: () {
                                                        controller
                                                            .addInterest();
                                                        Get.back();
                                                      },
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          CustomText(
                                                            text: "Save",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 15.sp,
                                                            color:
                                                                AppColors.white,
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
                                  child: Container(
                                    width: 75.w,
                                    margin: EdgeInsets.only(top: 8.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(999),
                                      color: Color(0xFFE6F6FE),
                                      border: Border(),
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: AppColors.customBlue,
                                          size: 20.h,
                                        ),
                                        CustomText(
                                          text: "New",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          color: AppColors.customBlue,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),

                        /// Add interest
                        SizedBox(
                          height: 28.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Language",
                              color: AppColors.textSecondary,
                              fontSize: 16.sp,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.languageEdit.value = true;
                              },
                              child: CustomText(
                                text: "Edit",
                                color: AppColors.customBlue,
                                fontSize: 16.sp,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Obx(() => Wrap(
                              direction: Axis.horizontal,
                              spacing: 8.w,
                              runSpacing: 8.h,
                              children: [
                                ...controller.languageList.map((element) =>
                                    shortContainer(
                                        element,
                                        controller,
                                        controller.languageList,
                                        controller.languageEdit)),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        backgroundColor:
                                            AppColors.primaryBackground,
                                        builder: (context) {
                                          return SizedBox(
                                            width: double.infinity,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 13.w,
                                                  vertical: 16.h),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                      text: "Add Language",
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    CustomTextField(
                                                        controller: controller
                                                            .languageTEController,
                                                        hintText: "Type here",
                                                        radius: 12),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    OutlinedButton(
                                                      style: OutlinedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            AppColors
                                                                .customBlue,
                                                        side: BorderSide.none,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 14.h),
                                                      ),
                                                      onPressed: () {
                                                        controller
                                                            .addLanguage();
                                                        Get.back();
                                                      },
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          CustomText(
                                                            text: "Save",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 15.sp,
                                                            color:
                                                                AppColors.white,
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
                                  child: Container(
                                    width: 75.w,
                                    margin: EdgeInsets.only(top: 8.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(999),
                                      color: Color(0xFFE6F6FE),
                                      border: Border(),
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: AppColors.customBlue,
                                          size: 20.h,
                                        ),
                                        CustomText(
                                          text: "New",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          color: AppColors.customBlue,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.customBlue,
              side: BorderSide.none,
              padding: EdgeInsets.symmetric(vertical: 14.h),
            ),
            onPressed: () {
              controller.educationEdit.value = false;
              controller.experienceEdit.value = false;
              controller.skillEdit.value = false;
              controller.toolsEdit.value = false;
              controller.interestEdit.value = false;
              controller.languageEdit.value = false;
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Save",
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: AppColors.white,
                ),
                CustomText(
                  text: "Save",
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: AppColors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
