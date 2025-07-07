
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/app_texts.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';
import 'package:shuroo/features/authentication/controllers/social_login_controller.dart';

import '../../../../routes/app_routes.dart';
import '../widgets/custom_button_create_screen.dart';

class CreateAccountScreen extends StatelessWidget {
   CreateAccountScreen({super.key});
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
                  child: InkWell(onTap: (){
                    Get.back();                },child: Icon(Icons.arrow_back, size: 24)),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Image.asset(ImagePath.logo, height: 62.w, width: 62.w),
                      SizedBox(height: 12),
                      CustomText(text: AppText.sign_up_start, fontSize: 24.sp),
                      CustomText(text: AppText.exploring, fontSize: 24),
                      ///SizedBox(height: 60),
                      Container(margin:EdgeInsets.only(top: 60),child: Image.asset(ImagePath.group, height: 206.w, width: 217)),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 60,
                // ),
                CustomButtonCreateScreen(onTap: (){
                  Get.toNamed(AppRoute.createAccountFilledScreen);
                },
                  text: AppText.sign_up_phone_email,
                  img: IconPath.iconoir_user,
                  left: 35.5,
                  right: 7.5,
                ),
            
                CustomButtonCreateScreen(onTap: (){},
                  text: AppText.sign_up_facebook,
                  img: IconPath.facebook_icon,
                  left: 53,
                  right: 8.5,
                ),

                CustomButtonCreateScreen(onTap: (){
                  controller.signInWithGoogle();

                },
                  text: AppText.sign_up_google,
                  img: IconPath.google_icon,
                  left: 60.79,
                  right: 10.21,
                ),
            
                CustomButtonCreateScreen(onTap: (){},
                  text: AppText.sign_up_apple,
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

