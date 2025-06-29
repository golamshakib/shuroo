import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_back_button.dart';
import 'package:shuroo/core/common/widgets/custom_submit_button.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/core/utils/constants/will_be_deleted.dart';
import 'package:shuroo/features/jobs/controller/job_details_controller.dart';
import 'package:shuroo/routes/app_routes.dart';

class JobDetailsScreen extends StatelessWidget {
   JobDetailsScreen({super.key});

   final controller = Get.put(JobDetailsController());

  @override
  Widget build(BuildContext context) {
    final jobId  = Get.arguments;
    final data = controller.getSingleJobModel.value.data;

    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        title: CustomText(text: data?.name ?? '',color: AppColors.textPrimary,fontWeight: FontWeight.w600, fontSize: 20.sp),
        actions: [
          IconButton(
          onPressed: (){

          }, icon: Icon(Icons.favorite_border_outlined)),

          IconButton(
          onPressed: (){

          }, icon: Icon(Icons.share_outlined)),

        ],
      ),
      body: SafeArea(child: Padding(padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.textWhite,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xffF5F5F5),width: 1),

                ),
                child: Column(
                  children: [
                    Image.asset(WillBeDeleted.uiLogo,height: 60.h,width: 60.w),
                    CustomText(text: 'UI/UX Designer',fontSize: 24.sp,color: AppColors.textPrimary,fontWeight: FontWeight.w600),
                    CustomText(text: 'Wild World Conservation',fontSize: 14.sp,color: AppColors.textGray,fontWeight: FontWeight.w500),
                    Row(
                      children: [
                        CustomText(text: 'Deadline',fontSize: 12.sp,color: Color(0xff015C89),fontWeight: FontWeight.w400),
                        Spacer(),
                        CustomText(text: 'Salary',fontSize: 12.sp,color: Color(0xff015C89),fontWeight: FontWeight.w400),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(text: '15 May 2025',fontSize: 14.sp,color: Color(0xff353A40),fontWeight: FontWeight.w500),
                        Spacer(),
                        CustomText(text: '\$2000yr',fontSize: 14.sp,color: Color(0xff353A40),fontWeight: FontWeight.w500),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.textWhite,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xffF5F5F5),width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(IconPath.jobIcon,height: 20.h,width: 20.w),
                        SizedBox(width: 8.w),
                        CustomText(text: '0-1 yrs', color: Color(0xff353A40),fontSize: 16.sp,fontWeight: FontWeight.w400,)
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        SvgPicture.asset(IconPath.locationIcon,height: 20.h,width: 20.w),
                        SizedBox(width: 8.w),
                        CustomText(text: 'Portland, OR', color: Color(0xff353A40),fontSize: 16.sp,fontWeight: FontWeight.w400,)
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        SvgPicture.asset(IconPath.personIcon,height: 20.h,width: 20.w),
                        SizedBox(width: 8.w),
                        CustomText(text: 'Portland, OR', color: Color(0xff353A40),fontSize: 16.sp,fontWeight: FontWeight.w400,)
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        SvgPicture.asset(IconPath.walletIcon,height: 20.h,width: 20.w),
                        SizedBox(width: 8.w),
                        CustomText(text: 'Portland, OR', color: Color(0xff353A40),fontSize: 16.sp,fontWeight: FontWeight.w400,)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.textWhite,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xffF5F5F5),width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'Must have skills', fontSize: 14.sp,color: Color(0xff015C89),fontWeight: FontWeight.w400),
                    CustomText(text: 'UI/UX, UI Development', fontSize: 16.sp,color: Color(0xff353A40),fontWeight: FontWeight.w400),
                    SizedBox(height: 16.h),
                    CustomText(text: 'Good to have skills', fontSize: 14.sp,color: Color(0xff015C89),fontWeight: FontWeight.w400),
                    CustomText(text: 'UX, UI, Design', fontSize: 16.sp,color: Color(0xff353A40),fontWeight: FontWeight.w400),

                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.textWhite,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xffF5F5F5),width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'What you’ll do', fontSize: 14.sp,color: Color(0xff015C89),fontWeight: FontWeight.w400),
                    SizedBox(height: 4.h),
                    CustomText(text: "We're seeking a creative UI/UX Designer to craft intuitive, user-focused digital experiences. You'll collaborate with cross-functional teams to design interfaces that align with our brand and meet real user needs.", fontSize: 16.sp,color: Color(0xff353A40),fontWeight: FontWeight.w400),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.textWhite,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xffF5F5F5),width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'Industry type', fontSize: 14.sp,color: Color(0xff015C89),fontWeight: FontWeight.w400),
                    CustomText(text: 'UI/UX, UI Development', fontSize: 16.sp,color: Color(0xff353A40),fontWeight: FontWeight.w400),

                    SizedBox(height: 16.h),
                    CustomText(text: 'Department', fontSize: 14.sp,color: Color(0xff015C89),fontWeight: FontWeight.w400),
                    CustomText(text: 'UX, UI, Design', fontSize: 16.sp,color: Color(0xff353A40),fontWeight: FontWeight.w400),

                    SizedBox(height: 16.h),
                    CustomText(text: 'Role', fontSize: 14.sp,color: Color(0xff015C89),fontWeight: FontWeight.w400),
                    CustomText(text: 'UI/UX Designer', fontSize: 16.sp,color: Color(0xff353A40),fontWeight: FontWeight.w400),

                    SizedBox(height: 16.h),
                    CustomText(text: 'Role', fontSize: 14.sp,color: Color(0xff015C89),fontWeight: FontWeight.w400),
                    CustomText(text: 'Full Time, Permanent', fontSize: 16.sp,color: Color(0xff353A40),fontWeight: FontWeight.w400),

                    SizedBox(height: 16.h),
                    CustomText(text: 'Education', fontSize: 14.sp,color: Color(0xff015C89),fontWeight: FontWeight.w400),
                    CustomText(text: 'MS/M.Sc(Science in Interaction Design)', fontSize: 16.sp,color: Color(0xff353A40),fontWeight: FontWeight.w400),

                  ],
                ),
              ), SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.textWhite,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xffF5F5F5),width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'About company', fontSize: 14.sp,color: Color(0xff015C89),fontWeight: FontWeight.w400),
                    SizedBox(height: 8.h),
                    CustomText(text: "Collective Software Pvt Ltd is mainly into mobile app development and in development of various enterprise software.", fontSize: 16.sp,color: Color(0xff000000),fontWeight: FontWeight.w400),

                    SizedBox(height: 10.h),
                    CustomText(text: 'Company Name :  Wild Word Organization', fontSize: 14.sp,color: Color(0xff000000),fontWeight: FontWeight.w400),
                    CustomText(text: 'Headquarters :  Portland, OR', fontSize: 14.sp,color: Color(0xff000000),fontWeight: FontWeight.w400),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              CustomSubmitButton(
                  text: 'Apply Now',
                  onTap: (){
                    Get.offNamed(AppRoute.appliedJobScreen);
                  })
            ],
          ),
        ),
      )),
    );
  }
}
