import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text_field.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/jobs/controller/job_controller.dart';
import 'package:shuroo/routes/app_routes.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../../favorites/controller/favourite_controller.dart';


class JobScreen extends StatelessWidget {

  final favouriteController = Get.find<FavouriteController>();
  final JobController controller = Get.put(JobController());

  JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomText(
          text: 'Job Board',
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: controller.search,
                    hintText: 'Search job title or keyword',
                    readOnly: true,
                    onTap: (){
                      Get.toNamed(AppRoute.searchResultScreen);
                    },
                    prefixIcon: Icon(Icons.search),
                  ),
                  SizedBox(height: 12.h),
                  // Category Grid
                  SizedBox(
                    height: 100.h,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1,
                      ),
                      itemCount: controller.jobs.length,
                      itemBuilder: (context, index) {
                        final jobs = controller.jobs[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(controller.jobScreens[index]);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.textWhite,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(jobs.icon ?? ''),
                                SizedBox(height: 8),
                                Flexible(
                                  child: CustomText(
                                    text: jobs.title ?? '',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),

                 //  Job List
                  Obx(() {
                    if (controller.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    }

                    final jobs = controller.getAllJobsModel.value.data ?? [];

                    if (jobs.isEmpty) {
                      return Center(child: Text("No jobs found"));
                    }
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: jobs.length,
                      itemBuilder: (context, index) {
                        final job = jobs[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Color(0xffF5F5F5), width: 0.2),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.grey[200],
                                    backgroundImage: job.company?.logoImage != null &&
                                        job.company!.logoImage!.isNotEmpty
                                        ? NetworkImage(job.company!.logoImage!)
                                        : AssetImage(ImagePath.dummyProfilePicture)
                                    as ImageProvider,
                                  ),
                                  title: CustomText(
                                    text: job.name ?? '',
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textPrimary,
                                  ),
                                  subtitle: CustomText(
                                    text: job.company?.name ?? '',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textGray,
                                  ),
                                  trailing:  Obx(() {
                                    final jobId = job.id.toString();
                                    final isFav = favouriteController.isJobFavorite(jobId);

                                    return IconButton(
                                      onPressed: () {
                                        if (isFav) {
                                          favouriteController.removeFavorite(jobId);
                                        } else {
                                          favouriteController.addFavorite(jobId);
                                        }
                                      },
                                      icon: Icon(
                                        isFav ? Icons.favorite : Icons.favorite_border_outlined,
                                        color: isFav ? Colors.red : AppColors.textPrimary,
                                      ),
                                    );
                                  }),
                                ),

                                // Tags (optional, from your model)
                                if (job.employmentType != null)
                                  Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Row(
                                      children: [
                                        _buildTag(job.employmentType!),
                                      ],
                                    ),
                                  ),

                                SizedBox(height: 14.h),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Divider(color: Color(0xffF5F5F5)),
                                ),
                                SizedBox(height: 14.h),

                                // Location + Apply Now
                                Padding(
                                  padding:
                                  EdgeInsets.only(bottom: 16, left: 16, right: 16),
                                  child: Row(
                                    children: [
                                      CustomText(
                                        text: job.location ?? '',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textPrimary,
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          final jobId = job.id?.toString() ?? '';
                                          if (jobId.isNotEmpty) {
                                            Get.toNamed(AppRoute.jobDetailsScreen,
                                                arguments: jobId);
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            CustomText(
                                              text: 'Apply Now',
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.custom_blue,
                                              decoration: TextDecoration.underline,
                                              decorationColor: AppColors.custom_blue,
                                            ),
                                            SizedBox(width: 4.w),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: AppColors.custom_blue,
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
    );
  }

  Widget _buildTag(String text) {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: Color(0xffF4F4F4),
          borderRadius: BorderRadius.circular(4),
        ),
        child: CustomText(
          text: text,
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.textGray,
        ),
      ),
    );
  }
}
