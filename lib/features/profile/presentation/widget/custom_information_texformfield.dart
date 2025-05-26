

import 'package:flutter/cupertino.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_text_field.dart';

Widget customInformationTFFiled(String title, String message,TextEditingController textEController, Widget? icon, bool seeText){

  return Padding(
    padding: EdgeInsets.only(bottom: 12.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: title, fontSize: 12.sp, fontWeight: FontWeight.w400,),
        SizedBox(height: 8.h,),
        CustomTextField(
          obscureText: seeText,
          controller: textEController,
          hintText: message,
          suffixIcon: icon,
        )
      ],
    ),
  );

}