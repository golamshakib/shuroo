
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';

import '../../../../core/common/widgets/custom_text.dart';

Widget customBackHeader(String title, double gap){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Icon(Icons.arrow_back_outlined),
      ),
      SizedBox(width: gap.w,),
      CustomText(text: title, fontSize: 20.sp,),
    ],
  );
}