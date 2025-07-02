import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/services/auth_service.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';
import 'package:shuroo/features/home/controller/home_controller.dart';
import 'package:shuroo/features/profile/controller/profile_information_controller.dart';
import 'package:shuroo/routes/app_routes.dart';

class CustomDrower extends StatelessWidget {
  CustomDrower({super.key});

  final HomeController homeController = Get.put(HomeController());
  final controller = Get.find<ProfileInformationController>();

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
              Obx(() {
                final user = controller.userProfile.value.data;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipOval(
                          child: user?.image != null
                              ? Image.network(
                                  user!.image!,
                                  height: 44.h,
                                  width: 44.h,
                                  fit: BoxFit.fill,
                                )
                              : Image.asset(
                                  ImagePath.dummyProfilePicture,
                                  height: 44.h,
                                  width: 44.h,
                                  fit: BoxFit.fill,
                                ),
                        ),
                        SizedBox(width: 12.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: user?.name ?? 'User Name',
                              fontWeight: FontWeight.w500,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoute.personalCreationScreen);
                              },
                              child: CustomText(
                                text: "Complete profile",
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: AppColors.customBlue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_outlined),
                  ],
                );
              }),
              SizedBox(height: 8.h),
              Divider(thickness: 1.sp, color: const Color(0xFFE6E6E7)),
              SizedBox(height: 20.h),

              // My Profile
              _drawerItem(
                icon: IconPath.pIcon,
                label: "My Profile",
                onTap: () => Get.toNamed(AppRoute.profileInformationScreen),
              ),

              // Password
              _drawerItem(
                icon: IconPath.lockIcon,
                label: "Password",
                onTap: () => Get.toNamed(AppRoute.changePasswordScreen),
              ),

              // Notification Toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _drawerItem(
                    icon: IconPath.notifyIcon,
                    label: "Notification",
                    onTap: () {},
                    isClickable: false,
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: Obx(() => Switch(
                          activeTrackColor: const Color(0xFF353A40),
                          value: homeController.activeNotification.value,
                          onChanged: (newValue) {
                            homeController.activeNotification.value = newValue;
                          },
                        )),
                  ),
                ],
              ),

              // About
              _drawerItem(
                icon: IconPath.aboutIcon,
                label: "About",
                onTap: () => Get.toNamed(AppRoute.aboutScreen),
              ),

              // Help & Support
              _drawerItem(
                icon: IconPath.helpIcon,
                label: "Help & Support",
                onTap: () => Get.toNamed(AppRoute.helpScreen),
              ),

              Divider(thickness: 1.sp, color: const Color(0xFFE6E6E7)),
              SizedBox(height: 16.h),

              // Sign Out
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: AppColors.white,
                        actionsPadding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.h),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(ImagePath.group, fit: BoxFit.fill),
                              SizedBox(height: 24.h),
                              CustomText(
                                text: "You’ve Signed Out!",
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 8.h),
                              CustomText(
                                text:
                                    "Your journey doesn’t stop here see you again soon!",
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                color: AppColors.textSecondary,
                              ),
                              SizedBox(height: 24.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: AppColors.white,
                                        side: BorderSide(
                                            color: AppColors.textSecondary),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 11.h),
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: CustomText(
                                        text: "No",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.sp,
                                        color: AppColors.textSecondary,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 11.w),
                                  Flexible(
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: AppColors.customBlue,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 11.h),
                                      ),
                                      onPressed: () async {
                                        Get.back(); // close dialog first
                                        print('============================Logout started');
                                        await AuthService.logoutUser();
                                        print('============================Logout completed');
                                      },
                                      child: CustomText(
                                        text: "Yes",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.sp,
                                        color: AppColors.white,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Row(
                  children: [
                    Image.asset(IconPath.logoutIcon, height: 16.h, width: 16.w),
                    SizedBox(width: 6.w),
                    CustomText(
                      text: "Sign Out",
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem({
    required String icon,
    required String label,
    VoidCallback? onTap,
    bool isClickable = true,
  }) {
    return GestureDetector(
      onTap: isClickable ? onTap : null,
      child: Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: Row(
          children: [
            Image.asset(icon, height: 16.h, width: 16.w),
            SizedBox(width: 6.w),
            CustomText(
              text: label,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: const Color(0xFF353A40),
            ),
          ],
        ),
      ),
    );
  }
}
