
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/profile/controller/personal_creation_controller.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';

Widget shortContainer(String title, PersonalCreationController controller, RxList list, RxBool seen){

  return Stack(
    children: [
      Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              color: AppColors.white
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: CustomText(text: title, fontWeight: FontWeight.w500, fontSize: 12.sp,),
        ),
      ),
      if(seen.value)
      Positioned(
        top: 0,
        right: -2,
        child: GestureDetector(
          onTap: (){
            list.remove(title);
          },
          child: Icon(Icons.cancel, color: Colors.red,),
        ),
      )
    ],
  );
}