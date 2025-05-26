

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';

Widget commentBody(dynamic controller, Map<String, dynamic> row){

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(row['image'], height: 32.h, width: 32.w,),
              ),
              SizedBox(width: 6.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(text: row['name'], fontWeight: FontWeight.w600, ),
                  CustomText(text: row['designation'], fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                ],
              )
            ],
          ),
          CustomText(text: row['time'], fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.textSecondary,)
        ],
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(text: row['comment'], fontWeight: FontWeight.w400, textOverflow: TextOverflow.ellipsis, maxLines: 4,),
            SizedBox(height: 12.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: CustomText(text: "Like", fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                ),
                SizedBox(width: 8.w,),
                CustomText(text: row['like'].toString(), fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                SizedBox(width: 12.w,),
                CustomText(text: "|", fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                SizedBox(width: 12.w,),
                GestureDetector(
                  onTap: (){},
                  child: CustomText(text: "Reply", fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                ),
                SizedBox(width: 8.w,),
                CustomText(text: row['reply'].toString(), fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                SizedBox(width: 12.w,),
              ],
            ),
            /// Adding the replies

            if(row['reply'] > 0)
              ...row['replies'].map((subRow) =>
                  Padding(
                    padding: EdgeInsets.only(top: 27.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipOval(
                                  child: Image.asset(subRow['image'], height: 32.h, width: 32.w,),
                                ),
                                SizedBox(width: 6.w,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomText(text: subRow['name'], fontWeight: FontWeight.w600, ),
                                    CustomText(text: subRow['designation'], fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                                  ],
                                )
                              ],
                            ),
                            CustomText(text: subRow['time'], fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.textSecondary,)
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 12.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomText(text: subRow['comment'], fontWeight: FontWeight.w400, textOverflow: TextOverflow.ellipsis, maxLines: 4,),
                              SizedBox(height: 12.h,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: (){},
                                    child: CustomText(text: "Like", fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                                  ),
                                  SizedBox(width: 8.w,),
                                  //CustomText(text: row['replies']['like'].toString(), fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                                  SizedBox(width: 12.w,),
                                  CustomText(text: "|", fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                                  SizedBox(width: 12.w,),
                                  GestureDetector(
                                    onTap: (){},
                                    child: CustomText(text: "Reply", fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                                  ),
                                  SizedBox(width: 8.w,),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
              )
          ],
        ),
      )
    ],
  );
}