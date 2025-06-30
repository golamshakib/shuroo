import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text_field.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';
import 'package:shuroo/features/jobs/controller/job_controller.dart';
import 'package:shuroo/routes/app_routes.dart';


class JobScreen extends StatelessWidget {
  final controller = Get.put(JobController());

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
      body: Obx(
            () => controller.isLoading.value
            ? Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        )
            : SafeArea(
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
                    prefixIcon: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.searchResultScreen);
                      },
                      child: Icon(Icons.search),
                    ),
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
                                if (jobs.icon != null)
                                  SvgPicture.asset(jobs.icon!),
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
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.getAllJobsModel.value.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final jobList = controller.getAllJobsModel.value.data![index];

                      // Safe logo image assignment
                      ImageProvider imageProvider;
                      if (jobList.company?.logoImage != null &&
                          jobList.company!.logoImage!.isNotEmpty) {
                        imageProvider = NetworkImage(jobList.company!.logoImage!);
                      } else {
                        imageProvider = AssetImage(ImagePath.dummyProfilePicture);
                      }

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
                                  backgroundImage: imageProvider,
                                ),
                                title: CustomText(
                                  text: jobList.name ?? '',
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textPrimary,
                                ),
                                subtitle: CustomText(
                                  text: jobList.company?.name ?? '',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textGray,
                                ),
                                trailing: Obx(() {
                                  bool isFavorite = controller.jobModelList.length > index
                                      ? controller.jobModelList[index].isFavorite.value
                                      : false;
                                  return InkWell(
                                    onTap: () => controller.toggleFavorite(index),
                                    child: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: AppColors.custom_blue,
                                      size: 20,
                                    ),
                                  );
                                }),
                              ),

                              // Tags
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Row(
                                  children: List.generate(3, (i) {
                                    return Padding(
                                      padding: EdgeInsets.only(right: 8.w),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Color(0xffF4F4F4),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: CustomText(
                                          text: jobList.employmentType ?? '',
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.textGray,
                                        ),
                                      ),
                                    );
                                  }),
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
                                padding: EdgeInsets.only(
                                    bottom: 16, left: 16, right: 16),
                                child: Row(
                                  children: [
                                    CustomText(
                                      text: jobList.location ?? '',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textPrimary,
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        final jobId = jobList.id?.toString() ?? '';
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


/// --------------------------------------------------


// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:shuroo/core/common/widgets/custom_text_field.dart';
// import 'package:shuroo/core/common/widgets/custom_text.dart';
// import 'package:shuroo/core/utils/constants/app_colors.dart';
// import 'package:shuroo/core/utils/constants/app_sizer.dart';
// import 'package:shuroo/core/utils/constants/icon_path.dart';
// import 'package:shuroo/core/utils/constants/image_path.dart';
// import 'package:shuroo/features/jobs/controller/job_controller.dart';
// import 'package:shuroo/routes/app_routes.dart';
//
// import '../../data/model/job_Model.dart';
//
// class JobScreen extends StatefulWidget {
//   JobScreen({super.key});
//
//   @override
//   State<JobScreen> createState() => _JobScreenState();
// }
//
// class _JobScreenState extends State<JobScreen> {
//   final controller = Get.put(JobController());
//
//   // @override
//   // void initState() {
//   //   controller.fetchAllJobs();
//   //   super.initState();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.scaffoldBackgroundColor,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: CustomText(
//           text: 'Job Board',
//           fontSize: 20.sp,
//           fontWeight: FontWeight.w600,
//           color: AppColors.textPrimary,
//         ),
//       ),
//       body: Obx(
//             () => controller.isLoading.value
//             ? Center(
//           child: CircularProgressIndicator(color: AppColors.primary),
//         )
//             : SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             child: SingleChildScrollView(
//               physics: BouncingScrollPhysics(),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CustomTextField(
//                     controller: controller.search,
//                     hintText: 'Search job title or keyword',
//                     prefixIcon: GestureDetector(
//                       onTap: () {
//                         Get.toNamed(AppRoute.searchResultScreen);
//                       },
//                       child: Icon(Icons.search),
//                     ),
//                   ),
//                   SizedBox(height: 12.h),
//
//                   // Category Grid
//                   SizedBox(
//                     height: 100.h,
//                     child: GridView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 4,
//                         crossAxisSpacing: 8,
//                         mainAxisSpacing: 8,
//                         childAspectRatio: 1,
//                       ),
//                       itemCount: controller.jobs.length,
//                       itemBuilder: (context, index) {
//                         final job = controller.jobs[index];
//                         return GestureDetector(
//                           onTap: () {
//                             if (index < controller.jobScreens.length) {
//                               Get.to(controller.jobScreens[index]);
//                             }
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: AppColors.textWhite,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 if (job.icon != null)
//                                   SvgPicture.asset(job.icon??IconPath.editIcon),
//                                 SizedBox(height: 8),
//                                 Flexible(
//                                   child: CustomText(
//                                     text: job.title ?? '',
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColors.textPrimary,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   SizedBox(height: 16.h),
//
//                   /// Job List
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: controller.getAllJobsModel.value.data?.length ?? 0,
//                     itemBuilder: (context, index) {
//                       final job = controller.getAllJobsModel.value.data![index];
//
//                       // Find corresponding job in jobModelList if exists
//                       JobModel? localJob;
//                       if (index < controller.jobModelList.length) {
//                         localJob = controller.jobModelList[index];
//                       }
//
//                       ImageProvider imageProvider;
//                       if (job.company?.logoImage != null &&
//                           job.company!.logoImage!.isNotEmpty) {
//                         imageProvider = NetworkImage(job.company!.logoImage!);
//                       } else {
//                         imageProvider = AssetImage(ImagePath.dummyProfilePicture);
//                       }
//
//                       return Padding(
//                         padding: EdgeInsets.symmetric(vertical: 10),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12),
//                             border: Border.all(color: Color(0xffF5F5F5), width: 0.2),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               ListTile(
//                                 leading: CircleAvatar(
//                                   backgroundColor: Colors.grey[200],
//                                   backgroundImage: imageProvider,
//                                 ),
//                                 title: CustomText(
//                                   text: job.name ?? '',
//                                   fontSize: 15.sp,
//                                   fontWeight: FontWeight.w500,
//                                   color: AppColors.textPrimary,
//                                 ),
//                                 subtitle: CustomText(
//                                   text: job.company?.name ?? '',
//                                   fontSize: 12.sp,
//                                   fontWeight: FontWeight.w400,
//                                   color: AppColors.textGray,
//                                 ),
//                                 trailing: InkWell(
//                                   onTap: () {
//                                     if (localJob != null) {
//                                       controller.toggleFavorite(index);
//                                     }
//                                   },
//                                   child: Icon(
//                                     localJob?.isFavorite.value ?? false
//                                         ? Icons.favorite
//                                         : Icons.favorite_border,
//                                     color: AppColors.custom_blue,
//                                     size: 20,
//                                   ),
//                                 ),
//                               ),
//
//                               // Tags
//                               Padding(
//                                 padding: EdgeInsets.only(left: 16),
//                                 child: Row(
//                                   children: [
//                                     if (job.employmentType != null)
//                                       Padding(
//                                         padding: EdgeInsets.only(right: 8.w),
//                                         child: Container(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 10, vertical: 4),
//                                           decoration: BoxDecoration(
//                                             color: Color(0xffF4F4F4),
//                                             borderRadius: BorderRadius.circular(4),
//                                           ),
//                                           child: CustomText(
//                                             text: job.employmentType!,
//                                             fontSize: 11.sp,
//                                             fontWeight: FontWeight.w400,
//                                             color: AppColors.textGray,
//                                           ),
//                                         ),
//                                       ),
//                                   ],
//                                 ),
//                               ),
//
//                               SizedBox(height: 14.h),
//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 16),
//                                 child: Divider(color: Color(0xffF5F5F5)),
//                               ),
//                               SizedBox(height: 14.h),
//
//                               // Location + Apply Now
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                     bottom: 16, left: 16, right: 16),
//                                 child: Row(
//                                   children: [
//                                     CustomText(
//                                       text: job.location ?? '',
//                                       fontSize: 12.sp,
//                                       fontWeight: FontWeight.w500,
//                                       color: AppColors.textPrimary,
//                                     ),
//                                     Spacer(),
//                                     GestureDetector(
//                                       onTap: () {
//                                         final jobId = job.id?.toString() ?? '';
//                                         if (jobId.isNotEmpty) {
//                                           Get.toNamed(AppRoute.jobDetailsScreen,
//                                               arguments: jobId);
//                                         }
//                                       },
//                                       child: Row(
//                                         children: [
//                                           CustomText(
//                                             text: 'Apply Now',
//                                             fontSize: 14.sp,
//                                             fontWeight: FontWeight.w500,
//                                             color: AppColors.custom_blue,
//                                             decoration: TextDecoration.underline,
//                                             decorationColor: AppColors.custom_blue,
//                                           ),
//                                           SizedBox(width: 4.w),
//                                           Icon(
//                                             Icons.arrow_forward,
//                                             color: AppColors.custom_blue,
//                                             size: 16,
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }