import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_blue_gray_button.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';

import '../../../message/presentation/screens/chat_details_screen.dart';

class AppliedJobCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String id;
  final String name;
  final String? status;
  final String date;
  final String salary;
  final VoidCallback onTap;

  const AppliedJobCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.name,
      required this.id,
      required this.date,
      this.status,
      required this.salary,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xffF5F5F5), width: 0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundImage: NetworkImage(imagePath)),
              SizedBox(width: 12.w),
              Expanded(
                child: CustomText(
                  text: title,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              if(status == "Applied")
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: AppColors.grayBlue,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: AppColors.custom_blue),
                  ),
                  child: CustomText(
                    text: 'Applied',
                    fontSize: 12.sp,
                    color: AppColors.custom_blue,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              if(status == "Viewed")
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3DC0A2).withAlpha(38),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: const Color(0xFF009D83)),
                  ),
                  child: CustomText(
                    text: 'Profile View',
                    fontSize: 12.sp,
                    color: const Color(0xFF009D83),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              if(status == "Shortlisted")
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF9EF),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: const Color(0xFFDF9100)),
                  ),
                  child: CustomText(
                    text: 'Short Listed',
                    fontSize: 12.sp,
                    color: const Color(0xFFDF9100),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              if(status == "Interviews")
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE7FEE6),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: const Color(0xFF00981C)),
                  ),
                  child: CustomText(
                    text: 'Interview',
                    fontSize: 12.sp,
                    color: const Color(0xFF00981C),
                    fontWeight: FontWeight.w400,
                  ),
                )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 50),
            child: CustomText(
              text: name,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textGray,
            ),
          ),
          SizedBox(height: 6.h),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: CustomText(
              text: date,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textGray,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: CustomText(
              text: salary,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textGray,
            ),
          ),
          SizedBox(height: 14.h),
          CustomBlueGrayButton(
            text: 'Send Message',
            onTap: (){
              log("============================================================================");
              log("Receiver Id: $id");
              log("Receiver Name: $name");
              log("Receiver imagepath: $imagePath");
              Get.to(() => ChatInboxScreen(receiverId: id, userName: name, image: imagePath, ));
            }
          )
        ],
      ),
    );
  }
}
