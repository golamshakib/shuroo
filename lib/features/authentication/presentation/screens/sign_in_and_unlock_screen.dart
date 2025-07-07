import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/authentication/controllers/social_login_controller.dart';
import 'package:shuroo/features/authentication/service/signin_with_apple_service.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../../../routes/app_routes.dart';
import '../widgets/custom_button_create_screen.dart';

class SignInAndUnlockScreen extends StatelessWidget {
  SignInAndUnlockScreen({super.key});
  final SocialLoginController controller = Get.find<SocialLoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 16, top: 12, right: 26),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back, size: 24)),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Image.asset(ImagePath.logo, height: 62.h, width: 62.w),
                      SizedBox(height: 12),
                      CustomText(
                          text: AppText.signinAndUnlock, fontSize: 24.sp),
                      CustomText(text: AppText.newpossibilities, fontSize: 24),

                      ///SizedBox(height: 60),
                      Container(
                          margin: EdgeInsets.only(top: 60),
                          child: Image.asset(ImagePath.group,
                              height: 206.w, width: 217)),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 60,
                // ),
                CustomButtonCreateScreen(
                  onTap: () {
                    print("sing in Screen");
                    Get.toNamed(AppRoute.signInScreen);
                  },
                  text: AppText.sign_In_phone_email,
                  img: IconPath.iconoir_user,
                  left: 35.5,
                  right: 7.5,
                ),

                CustomButtonCreateScreen(
                  onTap: () {},
                  text: AppText.sign_In_facebook,
                  img: IconPath.facebook_icon,
                  left: 53,
                  right: 10.5,
                ),

                CustomButtonCreateScreen(
                  onTap: () {
                    controller.signInWithGoogle();
                  },
                  text: AppText.sign_In_google,
                  img: IconPath.google_icon,
                  left: 60.79,
                  right: 10.21,
                ),

                CustomButtonCreateScreen(
                  onTap: () async {
                    try {
                      log("Apple Sign In button tapped");
                      final credential =
                          await SigninWithAppleService.signInWithApple();
                      if (credential != null) {
                        log("Apple Sign In successful with user: ${credential.userIdentifier}");

                        await controller.signInWithApple(
                            identifyToken: credential.identityToken ?? "",
                            fullName: credential.givenName);
                      }
                    } catch (e) {
                      log("Apple Sign In failed: $e");
                      Get.snackbar(
                        'Sign In Failed',
                        'Apple Sign In failed. Please try again.',
                        snackPosition: SnackPosition.TOP,
                      );
                    }
                  },
                  text: AppText.sign_In_apple,
                  img: IconPath.apple_icon,
                  left: 65,
                  right: 10.5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
