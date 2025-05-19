import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/icon_path.dart';

class MakePostHomeScreen extends StatelessWidget {
  const MakePostHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  IconPath.cancle,
                  height: 40,
                  width: 40,
                ),
                Image.asset(
                  IconPath.icon_pro,
                  height: 40.h,
                  width: 40.w,
                ),
                SizedBox(width: 10),
                CustomText(
                  text: AppText.rochelle,
                  fontSize: 18,
                  color: AppColors.textPrimary,
                )
              ],
            ),
            Container(
              width: 72.0.w,
              height: 40.0.h,
              decoration: BoxDecoration(
                color: AppColors.custom_blue,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Center(
                  child: CustomText(
                text: AppText.post,
                color: AppColors.white,
                fontSize: 14.0,
              )),
            )
          ],
        ),
      ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.only(
          left: 21,top: 20,right: 40
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Container(
              child: CustomText(text:
                        AppText.hiIamjams,fontSize:
                        15,color: AppColors.secondaryTextColor,),
            ),


         Container(
           margin: EdgeInsets.only(top:20.h ),
             alignment: Alignment.centerLeft,
             child:
         Image.asset(ImagePath.rectangle,
             fit: BoxFit.cover,))



          ],
        ),
      )),
    );
  }
}
