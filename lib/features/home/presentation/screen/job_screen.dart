import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuroo/core/common/widgets/custom_text_field.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/home/controller/job_controller.dart';
import 'package:get/get.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import 'applied_job_screen.dart';

class JobScreen extends StatelessWidget {
  JobScreen({super.key});

  final JobController controller = Get.put(JobController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        title: CustomText(
            text: 'Job Board',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary),
      ),
      body: SafeArea(
          child: Padding(padding: EdgeInsets.symmetric(
              horizontal: 16, vertical: 12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                    controller: controller.search,
                    hintText: 'Search job title or keyword ',
                    prefixIcon: Icon(Icons.search),
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                      height: 76.h,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, // number of columns
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1, // width / height
                        ),
                        itemCount: controller.jobs.length, // number of items
                        itemBuilder: (context, index) {
                          final jobs = controller.jobs[index];
                          return GestureDetector(
                            onTap: (){
                              Get.to(controller.jobScreens[index]);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.textWhite,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 14, left: 14, right: 14),
                                    child: SvgPicture.asset(jobs.icon!),
                                  ),
                                  Flexible(
                                    child: CustomText(
                                      text: jobs.title!,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textPrimary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                  ),
                  SizedBox(height: 16.h),
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.jobModelList.length,
                    itemBuilder: (context, index) {
                      final jobList = controller.jobModelList[index];
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
                                      jobList.uiImagePath!),
                                ),
                                title: CustomText(
                                  text: jobList.title!,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textPrimary,
                                ),
                                subtitle: CustomText(
                                  text: jobList.subTitle!,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textGray,),

                                trailing: Obx(() {
                                  return InkWell(
                                    onTap: ()=> controller.toggleFavorite(index),
                                    child:  Icon(
                                      controller.jobModelList[index].isFavorite.value
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: controller.jobModelList[index].isFavorite.value
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
                                        text: jobList.fullTimeText!,
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
                                        text: jobList.remoteText!,
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
                                        text: jobList.outreachText!,
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
                                      text: jobList.orText!,
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
                                            text: jobList.applyText!,
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