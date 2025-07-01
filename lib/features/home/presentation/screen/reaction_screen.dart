import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';

class ReactionScreen extends StatelessWidget {
  const ReactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back_outlined),
                      ),
                      SizedBox(width: 12.w,),
                      CustomText(text: "Reactions", fontSize: 20.sp,)
                    ],
                  ),
                ),
              ),
            ),
            /// Body
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Image.asset(IconPath.icon_pro, fit: BoxFit.fill, height: 40.h, width: 40.w,),
                      ),
                      SizedBox(width: 8.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: "Sophia Miller", fontWeight: FontWeight.w500,),
                          CustomText(text: "Front-End Developer", fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary),
                          SizedBox(height: 15.h,),
                          Container(height: 1, width: 300.w, color: Color(0xFFE6E6E7)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
