import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text_field.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/search_notification_chat/controller/search_controller.dart';
import '../../../../core/common/widgets/custom_back_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});

   final SearchingController controller =  Get.put(SearchingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: CustomBackButton(),
        title: CustomText(text: 'Explore Job', fontSize: 20.sp,color: AppColors.textPrimary,fontWeight: FontWeight.w600,),
      ),
      body: SafeArea(child: Padding(padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: controller.search,
                hintText: 'Type here to search',
              ),
              SizedBox(height: 16.h),
              // Top Companies Section
              CustomText(text: 'Top Companies', fontSize: 16.sp,color: AppColors.textPrimary,fontWeight: FontWeight.w500,),
              SizedBox(height: 12.h),
               GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,      // Horizontal space between items
                    mainAxisSpacing: 15,       // Vertical space between items
                    childAspectRatio: 1.1, // Width / Height ratio
                  ),
                  itemCount: controller.topCompaniesList.length,     // Total number of items
                  itemBuilder: (context, index) {
                    final topCompanies = controller.topCompaniesList[index];
                    return Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: Color(0xffF5F5F5),width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(topCompanies.icon!,height: 34.h,width: 34.w),
                          SizedBox(height: 12.h),
                          CustomText(text: topCompanies.title!, color: AppColors.textGray,fontSize: 16.sp,fontWeight: FontWeight.w600,),
                          SizedBox(height: 12.h),
                          GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4.5),
                              decoration: BoxDecoration(
                                color: AppColors.grayBlue,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: AppColors.custom_blue),
                              ),
                              child: CustomText(text: 'Applied', fontSize: 12.sp,color: AppColors.custom_blue,fontWeight: FontWeight.w400,),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),

              // Top Job Section
              SizedBox(height: 16.h),
              CustomText(text: 'Top Jobs', fontSize: 16.sp,color: AppColors.textPrimary,fontWeight: FontWeight.w500,),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.topJobsModelList.length,
                itemBuilder: (context, index) {
                  final topJobList = controller.topJobsModelList[index];
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
                                  topJobList.uiImagePath!),
                            ),
                            title: CustomText(
                              text: topJobList.title!,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimary,
                            ),
                            subtitle: CustomText(
                              text: topJobList.subTitle!,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textGray,),

                            trailing: Obx(() {
                              return InkWell(
                                onTap: ()=> controller.toggleFavorite(index),
                                child:  Icon(
                                  controller.topJobsModelList[index].isFavorite.value
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: controller.topJobsModelList[index].isFavorite.value
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
                                    text: topJobList.partTimeText!,
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
                                    text: topJobList.educationText!,
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
                                    text: topJobList.fieldWorkText!,
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
                                  text: topJobList.orText!,
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
                                        text: topJobList.applyText!,
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
