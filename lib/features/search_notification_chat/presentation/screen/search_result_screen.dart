import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/routes/app_routes.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../favorites/controller/favourite_controller.dart';
import '../../controller/search_result_controller.dart';
import '../../data/model/get_searched_jobs_model.dart';

class SearchResultScreen extends StatelessWidget {
  SearchResultScreen({super.key});

  final favouriteController = Get.find<FavouriteController>();
  final controller = Get.put(SearchResultController());

  final List<String> filters = ['ALL JOB', 'FULLTIME', 'PARTTIME', 'REMOTE', 'HYBRID'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              controller: controller.search,
              hintText: 'Search job title or keyword',
              prefixIcon: Icon(Icons.search),
              onChange: (value) {
                if (value.trim().isNotEmpty) {
                  controller.searchJobs(value.trim());
                } else {
                  controller.isSearching.value = false;
                  controller.getSearchJobModel.value = GetSearchedJobsModel(); // clear search result
                  //controller.selectedFilter.value = 'ALL JOB'; // reset filter
                }
              },
            ),
            SizedBox(height: 12.h),
            // Filter Chips
            Obx(() => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: filters.map((filter) {
                  final isSelected = controller.selectedFilter.value == filter;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      backgroundColor: AppColors.textWhite,
                      label: Text(filter),
                      selected: isSelected,
                      onSelected: (_) {
                        controller.isSearching.value = false; // ← Exit search mode
                        controller.setFilter(filter);
                      },
                      selectedColor: Colors.blue,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Color(0xff757575),
                      ),
                    ),
                  );
                }).toList(),
              ),
            )),
            SizedBox(height: 16.h),

            // No remove this data
            // Expanded(
            //   child: Obx(() {
            //     final jobs = controller.filteredJobs;
            //
            //     if (controller.isLoading.value) {
            //       return const Center(child: CircularProgressIndicator());
            //     }
            //
            //     if (jobs.isEmpty) {
            //       return const Center(child: Text("No jobs available"));
            //     }
            //
            //     return ListView.builder(
            //       itemCount: jobs.length,
            //       itemBuilder: (context, index) {
            //         final job = jobs[index];
            //         return Container(
            //           margin: const EdgeInsets.symmetric(vertical: 10),
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(12),
            //             border: Border.all(color: const Color(0xffF5F5F5), width: 0.2),
            //           ),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               ListTile(
            //                 leading: CircleAvatar(
            //                   backgroundImage: NetworkImage(job.company?.logoImage ?? ''),
            //                 ),
            //                 title: CustomText(
            //                   text: job.name ?? '',
            //                   fontSize: 15.sp,
            //                   fontWeight: FontWeight.w500,
            //                   color: AppColors.textPrimary,
            //                 ),
            //                 subtitle: CustomText(
            //                   text: job.company?.name ?? '',
            //                   fontSize: 12.sp,
            //                   fontWeight: FontWeight.w400,
            //                   color: AppColors.textGray,
            //                 ),
            //                 trailing: Obx(() {
            //                   final jobId = job.id.toString();
            //                   final isFav = favouriteController.isJobFavorite(jobId);
            //                   return IconButton(
            //                     onPressed: () {
            //                       if (isFav) {
            //                         favouriteController.removeFavorite(jobId);
            //                       } else {
            //                         favouriteController.addFavorite(jobId);
            //                       }
            //                     },
            //                     icon: Icon(
            //                       isFav ? Icons.favorite : Icons.favorite_border_outlined,
            //                       color: isFav ? AppColors.primary : AppColors.textPrimary,
            //                     ),
            //                   );
            //                 }),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(left: 16),
            //                 child: Row(
            //                   children: [
            //                     _buildTag(job.employmentType ?? ''),
            //                     SizedBox(width: 8.w),
            //                     // _buildTag(jobData.location ?? ''),
            //                     // SizedBox(width: 8.w),
            //                     // _buildTag(jobData.industryType ?? ''),
            //                   ],
            //                 ),
            //               ),
            //               SizedBox(height: 14.h),
            //               Padding(
            //                 padding: const EdgeInsets.symmetric(horizontal: 16),
            //                 child: Divider(color: const Color(0xffF5F5F5)),
            //               ),
            //               SizedBox(height: 14.h),
            //               Padding(
            //                 padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            //                 child: Row(
            //                   children: [
            //                     CustomText(
            //                       text: job.location ?? '',
            //                       fontSize: 12.sp,
            //                       fontWeight: FontWeight.w500,
            //                       color: AppColors.textPrimary,
            //                     ),
            //                     const Spacer(),
            //                     GestureDetector(
            //                       onTap: () {
            //                         final jobId = job.id?.toString() ?? '';
            //                         if (jobId.isNotEmpty) {
            //                           Get.toNamed(AppRoute.jobDetailsScreen, arguments: jobId);
            //                         }
            //                       },
            //                       child: Row(
            //                         children: [
            //                           CustomText(
            //                             text: "Apply Now",
            //                             decoration: TextDecoration.underline,
            //                             decorationthickness: 2,
            //                             decorationColor: AppColors.custom_blue,
            //                             fontSize: 14.sp,
            //                             fontWeight: FontWeight.w500,
            //                             color: AppColors.custom_blue,
            //                           ),
            //                           SizedBox(width: 4.w),
            //                           Icon(
            //                             Icons.arrow_forward,
            //                             color: AppColors.custom_blue,
            //                             size: 16,
            //                           )
            //                         ],
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         );
            //       },
            //     );
            //   }),
            // ),

            Expanded(
              child: Obx(() {
                final jobs = controller.filteredJobs;

                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (jobs.isEmpty) {
                  return const Center(child: Text("No jobs available"));
                }

                return ListView.builder(
                  itemCount: jobs.length,
                  itemBuilder: (context, index) {
                    final job = jobs[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xffF5F5F5), width: 0.2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(job.company?.logoImage ?? ''),
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
                            trailing: Obx(() {
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
                                  color: isFav ? AppColors.primary : AppColors.textPrimary,
                                ),
                              );
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Row(
                              children: [
                                _buildTag(job.employmentType ?? ''),
                                SizedBox(width: 8.w),
                                // _buildTag(jobData.location ?? ''),
                                // SizedBox(width: 8.w),
                                // _buildTag(jobData.industryType ?? ''),
                              ],
                            ),
                          ),
                          SizedBox(height: 14.h),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Divider(color: const Color(0xffF5F5F5)),
                          ),
                          SizedBox(height: 14.h),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                            child: Row(
                              children: [
                                CustomText(
                                  text: job.location ?? '',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textPrimary,
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    final jobId = job.id?.toString() ?? '';
                                    if (jobId.isNotEmpty) {
                                      Get.toNamed(AppRoute.jobDetailsScreen, arguments: jobId);
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      CustomText(
                                        text: "Apply Now",
                                        decoration: TextDecoration.underline,
                                        decorationthickness: 2,
                                        decorationColor: AppColors.custom_blue,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.custom_blue,
                                      ),
                                      SizedBox(width: 4.w),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: AppColors.custom_blue,
                                        size: 16,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),

          ],
        ),
      ),
    );
  }


  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xffF4F4F4),
        borderRadius: BorderRadius.circular(4),
      ),
      child: CustomText(
        text: text,
        fontSize: 11.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textGray,
      ),
    );
  }
}


