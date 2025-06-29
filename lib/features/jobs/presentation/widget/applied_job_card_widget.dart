import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_blue_gray_button.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/routes/app_routes.dart';

class AppliedJobCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String name;
  final String date;
  final String salary;
  final VoidCallback onTap;

  const AppliedJobCard(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.name,
      required this.date,
      required this.salary,
      required this.onTap})
      : super(key: key);

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
              CircleAvatar(backgroundImage: AssetImage(imagePath)),
              SizedBox(width: 12.w),
              Expanded(
                child: CustomText(
                  text: title,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
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
            onTap: onTap,
          )
        ],
      ),
    );
  }
}
