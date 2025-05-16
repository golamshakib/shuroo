import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/app_texts.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';

import '../widgets/custom_button_create_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 16, top: 12, right: 26),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Icon(Icons.arrow_back, size: 24),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Image.asset(ImagePath.logo, height: 62.w, width: 62.w),
                    SizedBox(height: 12),
                    CustomText(text: AppText.sign_up_start, fontSize: 24),
                    CustomText(text: AppText.exploring, fontSize: 24),
                    SizedBox(height: 60),
                    Image.asset(ImagePath.group, height: 206.w, width: 217),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              SignUpButton(onTap: (){},
                text: AppText.sign_up_phone_email,
                img: IconPath.iconoir_user,
              ),
              SizedBox(
                height: 12,
              ),
              SignUpButton(onTap: (){},
                text: AppText.sign_up_facebook,
                img: IconPath.facebook_icon,
              ),
              SizedBox(
                height: 12,
              ),
              SignUpButton(onTap: (){},
                text: AppText.sign_up_google,
                img: IconPath.google_icon,
              ),
              SizedBox(
                height: 12,
              ),
              SignUpButton(onTap: (){},
                text: AppText.sign_up_apple,
                img: IconPath.apple_icon,
              )
            ],
          ),
        ),
      ),
    );
  }
}

