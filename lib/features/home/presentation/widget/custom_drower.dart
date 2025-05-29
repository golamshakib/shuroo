import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';
import 'package:shuroo/features/home/controller/home_controller.dart';
import 'package:shuroo/routes/app_routes.dart';

class CustomDrower extends StatelessWidget {
  CustomDrower({super.key});

  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Image.asset(ImagePath.profilePic, height: 44.h, width: 44.h, fit: BoxFit.fill,),
                      ),
                      SizedBox(width: 12.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: "Nifat Chowdhury", fontWeight: FontWeight.w500,),
                          CustomText(text: "Complete profile", fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.customBlue,),
                        ],
                      )
                    ],
                  ),
                  Icon(Icons.arrow_forward_outlined,)
                ],
              ),
              SizedBox(height: 8.h,),
              Divider(
                thickness: 1.sp,
                color: const Color(0xFFE6E6E7),
              ),
              SizedBox(height: 20.h,),
              GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoute.personalCreationScreen);
                },
                child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Image.asset(IconPath.pIcon, height: 16.h, width: 16.w,),
                   SizedBox(width: 6.w,),
                   CustomText(text: "My Profile", fontWeight: FontWeight.w400, fontSize: 14.sp, color: const Color(0xFF353A40),)
                 ],
                ),
              ),
              SizedBox(height: 16.h,),
              GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoute.changePasswordScreen);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(IconPath.lockIcon, height: 16.h, width: 16.w,),
                    SizedBox(width: 6.w,),
                    CustomText(text: "Password", fontWeight: FontWeight.w400, fontSize: 14.sp, color: const Color(0xFF353A40),)
                  ],
                ),
              ),
              SizedBox(height: 16.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(IconPath.notifyIcon, height: 16.h, width: 16.w,),
                      SizedBox(width: 6.w,),
                      CustomText(text: "Notification", fontWeight: FontWeight.w400, fontSize: 14.sp, color: const Color(0xFF353A40),)
                    ],
                  ),
                  Transform.scale(
                    scale: .7,
                    child: Obx(() =>
                        Switch(
                          activeTrackColor: const Color(0xFF353A40),
                          value: homeController.activeNotification.value,
                          onChanged: (newValue){
                            homeController.activeNotification.value = !homeController.activeNotification.value;
                          },
                        )
                    ),
                  )
                ],
              ),
              SizedBox(height: 16.h,),
              GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoute.aboutScreen);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(IconPath.aboutIcon, height: 16.h, width: 16.w,),
                    SizedBox(width: 6.w,),
                    CustomText(text: "About", fontWeight: FontWeight.w400, fontSize: 14.sp, color: const Color(0xFF353A40),)
                  ],
                ),
              ),
              SizedBox(height: 16.h,),
              GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoute.helpScreen);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(IconPath.helpIcon, height: 16.h, width: 16.w,),
                    SizedBox(width: 6.w,),
                    CustomText(text: "Help & Support", fontWeight: FontWeight.w400, fontSize: 14.sp, color: const Color(0xFF353A40),)
                  ],
                ),
              ),
              SizedBox(height: 16.h,),
              Divider(
                thickness: 1.sp,
                color: const Color(0xFFE6E6E7),
              ),
              SizedBox(height: 16.h,),
              GestureDetector(
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          backgroundColor: AppColors.white,
                          actionsPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                          actionsAlignment: MainAxisAlignment.center,
                          actions: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(ImagePath.group, fit: BoxFit.fill,),
                                SizedBox(height: 24.h,),
                                CustomText(text: "You’ve Signed Out!", fontSize: 24.sp, fontWeight: FontWeight.w600, textAlign: TextAlign.center,),
                                SizedBox(height: 8.h,),
                                CustomText(text: "Your journey doesn’t stop here see you again soon!", fontWeight: FontWeight.w400, textAlign: TextAlign.center,color: AppColors.textSecondary,),
                                SizedBox(height: 24.h,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          backgroundColor: AppColors.white,
                                          side: BorderSide(color: AppColors.textSecondary),
                                          padding: EdgeInsets.symmetric(vertical: 11.h),
                                        ),
                                        onPressed: (){
                                          Get.back();
                                        },
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: CustomText(text: "No", fontWeight: FontWeight.w500, fontSize: 15.sp, color: AppColors.textSecondary, textAlign: TextAlign.center,),
                                        )
                                      ),
                                    ),
                                    SizedBox(width: 11.w,),
                                    Flexible(
                                      flex: 1,
                                      child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor: AppColors.customBlue,
                                            side: BorderSide.none,
                                            padding: EdgeInsets.symmetric(vertical: 11.h),
                                          ),
                                          onPressed: (){
                                            Get.offAllNamed(AppRoute.signInScreen);
                                          },
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: CustomText(text: "Yes", fontWeight: FontWeight.w500, fontSize: 15.sp, color: AppColors.white, textAlign: TextAlign.center,),
                                          )
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        );
                      }
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(IconPath.logoutIcon, height: 16.h, width: 16.w,),
                    SizedBox(width: 6.w,),
                    CustomText(text: "Sign Out", fontWeight: FontWeight.w400, fontSize: 14.sp, color: Colors.red,)
                  ],
                ),
              ),
              SizedBox(height: 16.h,),
            ],
          ),
        ),
      ),
    );
  }
}
