import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/common/widgets/custom_text_field.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/app_texts.dart';
import 'package:shuroo/features/post_creation_repost_delete/controller/make_post_controller.dart';
import 'package:shuroo/routes/app_routes.dart';

import '../../../../core/utils/constants/icon_path.dart';

class MakePostScreen extends StatelessWidget {
  MakePostScreen({super.key});

  MakePostController _controller = Get.put(MakePostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,

      appBar: AppBar(
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
                  height: 40,
                  width: 40,
                ),
                SizedBox(width: 10),
                CustomText(
                  text: AppText.rochelle,
                  fontSize: 18,
                  color: AppColors.textPrimary,
                )
              ],
            ),

         InkWell(
           onTap: (){

             Get.toNamed(AppRoute.makePostHomeScreen);

           },

           child: Container(
                  width: 72.0.w,
                  height: 40.0.h,
                  padding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFE6E6E7),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Center(
                      child: CustomText(
                        text: AppText.post,
                        color: AppColors.grayText,
                        fontSize: 14.0,
                      )),
                ),
         ),





          ],
        ),
      ),
      bottomSheet: Container(


        margin: EdgeInsets.only(left: 15, bottom: 12),
        child: Row(


          mainAxisAlignment: MainAxisAlignment.start,
          children: [


            SvgPicture.asset(
              IconPath.gallery,
              height: 24.w,
              width: 24.w,
            ),
            SizedBox(
              width: 8.w,
            ),
            CustomText(
              text: AppText.add_photos_video,
              fontSize: 14,
              color: Color(0xFF353A40),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                Container(
                    height: 100.w,
                    child: CustomTextField(
                        maxLine: 3,
                        controller: _controller.textController,
                        hintText: "Share your thoughts...")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
