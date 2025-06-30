import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text_field.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/profile/controller/personal_creation_controller.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';

Widget educationContainer(PersonalCreationController controller, BuildContext context){

  return Obx(() =>
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.h),
            color: AppColors.white
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...controller.educationList.map((row) =>
                Padding(
                  padding: EdgeInsets.only(bottom: 32.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(row['imagePath'], height: 34.h, width: 34.w, fit: BoxFit.fill,),
                      SizedBox(width: 12.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 265.w,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(text: row['name'], fontSize: 15.sp, fontWeight: FontWeight.w500,),
                                if(controller.educationEdit.value)
                                  GestureDetector(
                                    onTap: (){
                                      controller.educationList.remove(row);
                                    },
                                    child: CustomText(text: "Delete", fontSize: 15.sp, fontWeight: FontWeight.w500, color: Colors.red,),
                                  )
                              ],
                            ),
                          ),
                          CustomText(text: row['department'], fontSize: 12.sp, fontWeight: FontWeight.w400,),
                          CustomText(text: "${row['start']} - ${row['end']}", fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.textSecondary,),
                        ],
                      )
                    ],
                  ),
                )
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0xFFE6F6FE),
                side: BorderSide.none,
                padding: EdgeInsets.symmetric(vertical: 14.h),
              ),
              onPressed: (){
                showModalBottomSheet(
                  context: context,
                  backgroundColor: AppColors.primaryBackground,
                  builder: (context){
                    return SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: "Add Education", fontSize: 12.sp, fontWeight: FontWeight.w400,),
                            SizedBox(height: 8.h,),
                            CustomTextField(controller: controller.instituteNameTEController, hintText: "School/College/University", radius: 12),
                            SizedBox(height: 8.h,),
                            CustomTextField(controller: controller.majorSubjectTEController, hintText: "Subject(Major)", radius: 12),
                            SizedBox(height: 8.h,),
                            CustomTextField(controller: controller.minorSubjectTEController, hintText: "Subject(Minor", radius: 12),
                            SizedBox(height: 8.h,),
                            CustomTextField(controller: controller.degreeTEController, hintText: "Degree Earned", radius: 12),
                            SizedBox(height: 8.h,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: CustomTextField(controller: controller.startTEController, hintText: "Start Year", radius: 12,),
                                ),
                                SizedBox(width: 8.w,),
                                Flexible(
                                  flex: 1,
                                  child: CustomTextField(controller: controller.endTEController, hintText: "End Year", radius: 12),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h,),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: AppColors.customBlue,
                                side: BorderSide.none,
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                              ),
                              onPressed: (){
                                controller.educationAdd();
                                Get.back();
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(text: "Save", fontWeight: FontWeight.w500, fontSize: 15.sp, color: AppColors.white,)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: AppColors.customBlue, size: 20.h,),
                  SizedBox(width: 10.w,),
                  CustomText(text: "Education", fontWeight: FontWeight.w500, fontSize: 15.sp, color: AppColors.customBlue,)
                ],
              ),
            )
          ],
        ),
      )
  );
}