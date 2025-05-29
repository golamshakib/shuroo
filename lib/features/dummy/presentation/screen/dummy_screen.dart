import 'package:flutter/material.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
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
                        child: Image.asset(IconPath.icon_pro, height: 32.h, width: 32.w,),
                      ),
                      SizedBox(width: 6.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(text: "Johan Ronsse", fontWeight: FontWeight.w600, ),
                          CustomText(text: "Designer & Educator", fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                        ],
                      )
                    ],
                  ),
                  CustomText(text: "2d", fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.textSecondary,)
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(text: "Why are these not visible for viewers?", fontWeight: FontWeight.w400, textOverflow: TextOverflow.ellipsis, maxLines: 4,),
                    SizedBox(height: 12.h,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){},
                          child: CustomText(text: "Like", fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                        ),
                        SizedBox(width: 8.w,),
                        CustomText(text: "1", fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                        SizedBox(width: 12.w,),
                        CustomText(text: "|", fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                        SizedBox(width: 12.w,),
                        GestureDetector(
                          onTap: (){},
                          child: CustomText(text: "Reply", fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                        ),
                        SizedBox(width: 8.w,),
                        CustomText(text: "1", fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                        SizedBox(width: 12.w,),
                      ],
                    ),
                    SizedBox(height: 27.h,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
