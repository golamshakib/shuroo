

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/profile/controller/personal_creation_controller.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';

Widget educationContainer(PersonalCreationController controller){

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
                      Image.asset(IconPath.educationIcon, height: 34.h, width: 34.w, fit: BoxFit.fill,),
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
                                CustomText(text: "Brookfield University", fontSize: 15.sp, fontWeight: FontWeight.w500,),
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
                          CustomText(text: "Bachelor of Science in Environmental Science", fontSize: 12.sp, fontWeight: FontWeight.w400,),
                          CustomText(text: "2021 - Present", fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.textSecondary,),
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
              onPressed: (){},
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