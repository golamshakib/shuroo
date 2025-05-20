import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_back_button.dart';
import 'package:shuroo/core/common/widgets/custom_blue_gray_button.dart';
import 'package:shuroo/core/common/widgets/custom_submit_button.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/jobs/controller/applied_controller.dart';

class AppliedJobScreen extends StatelessWidget {
   AppliedJobScreen({super.key});

   final AppliedController controller = Get.put(AppliedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: CustomBackButton(),
        title: CustomText(text: 'Applied Jobs', fontSize: 20.sp,color: AppColors.textPrimary,fontWeight: FontWeight.w600,),
      ),
      body: SafeArea(child: Padding(padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.appliedList.length,
                itemBuilder: (context, index) {
                  final appliedList = controller.appliedList[index];
                  return Container(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Color(0xffF5F5F5), width: 0.2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(appliedList.imagePath!),
                              ),
                              SizedBox(width: 12.w),
                              CustomText(
                                text: appliedList.title!,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textPrimary,
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: (){

                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
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
                          Padding(
                            padding:  EdgeInsets.only(left: 50),
                            child: CustomText(
                              text: appliedList.name!,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textGray,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: CustomText(
                              text: appliedList.date!,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textGray,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: CustomText(
                              text: appliedList.salary!,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textGray,
                            ),
                          ),
                          SizedBox(height: 14.h),
                          CustomBlueGrayButton(
                              text: 'Send Message',
                              onTap: (){

                              })
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
