import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/app_texts.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';
import '../../../core/common/widgets/custom_submit_button.dart';
import '../../../core/utils/constants/app_colors.dart';
import '../../../routes/app_routes.dart';

class StartedScreen extends StatelessWidget {
  const StartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              ImagePath.started_screen_bg,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 55,
            right: 16,
            child: Container(
              width: 64,
              // height: 36,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color:
                    Colors.white, // You can change this to your preferred color
                borderRadius: BorderRadius.circular(50),
              ),
              child:
                  // Gap
                  Container(
                alignment: Alignment.center,
                child: Text(
                  "Skip",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppText.your_create,
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  AppText.your_control,
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: AppText.create_your,
                  fontSize: 16.sp,
                  color: Colors.white,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 32),
                CustomSubmitButton(
                  text: AppText.create_account,
                  onTap: () {
                    Get.toNamed(AppRoute.createAccountScreen);
                  },
                  fontSize: 15.sp,
                  color: AppColors.custom_blue,
                  borderRadius: BorderRadius.circular(50),
                ),
                SizedBox(
                  height: 16,
                ),
                CustomSubmitButton(
                    text: AppText.sign_in,
                    onTap: () {
                      Get.toNamed(AppRoute.signInAndUnlockScreen);
                    },
                    fontSize: 15,
                    color: AppColors.textWhite,
                    textColor: AppColors.textPrimary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
