
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shuroo/core/utils/constants/app_sizer.dart';
import '../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../../../routes/app_routes.dart';

class AccountConfirmScreen extends StatelessWidget {
  const AccountConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 16, top: 40, right: 26),
          child: SingleChildScrollView(
            child: Column(
              children: [

                Container(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Image.asset(ImagePath.logo, height: 62.w, width: 62.w),
                      SizedBox(height: 12),
                      CustomText(text: AppText.accountCreate, fontSize: 24.sp),
                      CustomText(text: AppText.successfully, fontSize: 24),
                      CustomText(
                        text: AppText.startExploringJobs,
                        fontSize: 14,
                        color: AppColors.grayText,
                      ),

                      ///SizedBox(height: 60),
                      Container(
                          margin: EdgeInsets.only(top: 123),
                          child: Image.asset(ImagePath.group,
                              height: 206.w, width: 217)),


                      Container(
                        margin: EdgeInsets.only(top: 106.99.h,bottom: 12),
                        child: CustomSubmitButton(

                          text: AppText.exploreJobs,
                          onTap: () {
                            print("....dfd.....");
                             Get.offAll(AppRoute.homeScreen);
                          },
                          color: AppColors.custom_blue,
                          borderRadius: BorderRadius.circular(50),
                          fontSize: 15.sp,

                        ),
                      ),




                  SizedBox(
                    width: double.infinity,
                    height: 48, // Fixed height
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        side: const BorderSide(
                          width: 1.5,
                          color: Colors.blue, // Change to your desired color
                        ),
                      ),
                      onPressed: (){}, child: CustomText(text: AppText.exploreTheAppFirst,fontSize: 15,color: AppColors.custom_blue,),
                    ),
                  )















                    ],
                  ),
                ),
                // SizedBox(
                //   height: 60,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
