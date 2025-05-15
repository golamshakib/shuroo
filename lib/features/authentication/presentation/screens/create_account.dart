import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuroo/core/common/widgets/custom_appbar.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/app_texts.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 16, top: 12),
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

              getsocilWidget(
                name: AppText.sign_up_phone_email,
                img: Icons.person,w: 35.5),
              SizedBox(height: 12,),
              getsocilWidget(
                name: AppText.sign_up_phone_email,
                img: Icons.person,w: 53.0),
              SizedBox(height: 12,),

              getsocilWidget(
                name: AppText.sign_up_phone_email,
                img: Icons.person,w: 60.79),
            ],
          ),
        ),
      ),
    );
  }
}

getsocilWidget({required String name,required IconData img,required double w}) {
 return Row(
    children: [
      Icon(img),
      SizedBox(width: w,),
      Text(name,style: TextStyle(
        fontSize: 15
      ),)

    ],
  );
}
