import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_back_button.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/search_notification_chat/controller/search_result_controller.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/utils/constants/app_colors.dart';

class SearchResultScreen extends StatelessWidget {
   SearchResultScreen({super.key});

   final SearchResultController controller = Get.put(SearchResultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: CustomBackButton(),
        title: CustomText(
            text: 'Job Result',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary),
      ),
      body: SafeArea(
          child: Padding(padding: EdgeInsets.symmetric(
              horizontal: 16, vertical: 12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: controller.search,
                    hintText: 'Search job title or keyword ',
                    prefixIcon: Icon(Icons.search),
                  ),
                  SizedBox(height: 12.h),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 4,      // Horizontal space between items
                      childAspectRatio: 2.7, // Width / Height ratio
                    ),
                    itemCount: controller.jobsSystemsModel.length,     // Total number of items
                    itemBuilder: (context, index) {
                      final jobsList = controller.jobsSystemsModel[index];
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(color: AppColors.custom_blue,width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                             CustomText(text: jobsList.title!, fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.custom_blue),
                          ],
                        )
                      );
                    },
                  ),
                  SizedBox(height: 12.h),
                  CustomText(text: "200 results", fontSize: 14.sp,color: Color(0xff555A5F),fontWeight: FontWeight.w400),

                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.searchModelList.length,
                    itemBuilder: (context, index) {
                      final searchResultList = controller.searchModelList[index];
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
                                  backgroundImage: AssetImage(
                                      searchResultList.uiImagePath!),
                                ),
                                title: CustomText(
                                  text: searchResultList.title!,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textPrimary,
                                ),
                                subtitle: CustomText(
                                  text: searchResultList.subTitle!,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textGray,),

                                trailing: Obx(() {
                                  return InkWell(
                                    onTap: ()=> controller.toggleFavorite(index),
                                    child:  Icon(
                                      controller.searchModelList[index].isFavorite.value
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: controller.searchModelList[index].isFavorite.value
                                          ? AppColors.custom_blue
                                          : AppColors.custom_blue,
                                      size: 20,
                                    ),);
                                }),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Color(0xffF4F4F4),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: CustomText(
                                        text: searchResultList.fullTimeText!,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textGray,
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Color(0xffF4F4F4),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: CustomText(
                                        text: searchResultList.remoteText!,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textGray,
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Color(0xffF4F4F4),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: CustomText(
                                        text: searchResultList.outreachText!,
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
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Divider(
                                  color: Color(0xffF5F5F5),
                                ),
                              ),
                              SizedBox(height: 14.h),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: 16, left: 16, right: 16),
                                child: Row(
                                  children: [
                                    CustomText(
                                      text: searchResultList.orText!,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textPrimary,),

                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        print('Apply......................');
                                      },
                                      child: Row(
                                        children: [
                                          CustomText(
                                            text: searchResultList.applyText!,
                                            decoration: TextDecoration
                                                .underline,
                                            decorationthickness: 2,
                                            decorationColor: AppColors
                                                .custom_blue,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.custom_blue,),
                                          SizedBox(width: 4.w,),
                                          Icon(Icons.arrow_forward,
                                            color: AppColors.custom_blue,
                                            size: 16,)
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
