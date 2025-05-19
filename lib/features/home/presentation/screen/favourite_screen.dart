import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/home/controller/favourite_controller.dart';

import '../../../../core/utils/constants/app_colors.dart';

class FavouriteScreen extends StatelessWidget {
   FavouriteScreen({super.key});

   final FavouriteController controller = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        title: CustomText(
            text: 'Favorites', fontSize: 20.sp,fontWeight: FontWeight.w600,color: AppColors.textPrimary),
      ),
      body: SafeArea(child: Padding(padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.favoritesList.length,
                  itemBuilder: (context, index) {
                    final favoritesList = controller.favoritesList[index];
                    return Container(
                           margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: Color(0xffF5F5F5), width: 0.2),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: AssetImage(favoritesList.uiImagePath!),
                                ),
                                title: CustomText(
                                  text: favoritesList.title!,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                color: AppColors.textPrimary,
                                ),
                                subtitle: CustomText(
                                  text: favoritesList.subTitle!,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textGray,),
                                trailing: Icon(Icons.favorite, color: AppColors.custom_blue,size: 20,),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Color(0xffF4F4F4),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: CustomText(
                                          text: favoritesList.fullTimeText!,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.textGray,
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Color(0xffF4F4F4),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: CustomText(
                                          text: favoritesList.remoteText!,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.textGray,
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Color(0xffF4F4F4),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: CustomText(
                                          text: favoritesList.outreachText!,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.textGray,
                                        ),
                                      ),
                                    ],
                                  ),
                              ),
                              SizedBox(height: 14.h),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 16),
                                child: Divider(
                                  color: Color(0xffF5F5F5),
                                ),
                              ),
                              SizedBox(height: 14.h),
                              Padding(
                                padding: EdgeInsets.only(bottom: 16,left: 16,right: 16),
                                child: Row(
                                  children: [
                                    CustomText(
                                      text: favoritesList.orText!,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textPrimary,),

                                    Spacer(),
                                    GestureDetector(
                                      onTap: (){
                                        print('Apply......................');
                                      },
                                      child: Row(
                                        children: [
                                          CustomText(
                                            text: favoritesList.applyText!,
                                            decoration: TextDecoration.underline,
                                            decorationthickness: 2,
                                            decorationColor: AppColors.custom_blue,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.custom_blue,),
                                          SizedBox(width: 4.w,),
                                          Icon(Icons.arrow_forward, color: AppColors.custom_blue,size: 16,)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                      );
                  },
                ),
            ],
          ),
        ),
      )),
    );
  }
}
