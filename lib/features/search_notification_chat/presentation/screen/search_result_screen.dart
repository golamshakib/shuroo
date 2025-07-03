// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shuroo/core/common/widgets/custom_back_button.dart';
// import 'package:shuroo/core/utils/constants/app_sizer.dart';
// import 'package:shuroo/features/search_notification_chat/controller/search_result_controller.dart';
//
// import '../../../../core/common/widgets/custom_text.dart';
// import '../../../../core/common/widgets/custom_text_field.dart';
// import '../../../../core/utils/constants/app_colors.dart';
//
// class SearchResultScreen extends StatelessWidget {
//    SearchResultScreen({super.key});
//
//    final SearchResultController controller = Get.put(SearchResultController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.scaffoldBackgroundColor,
//       appBar: AppBar(
//         leading: CustomBackButton(),
//         title: CustomText(
//             text: 'Job Result',
//             fontSize: 20.sp,
//             fontWeight: FontWeight.w600,
//             color: AppColors.textPrimary),
//       ),
//       body: SafeArea(
//           child: Padding(padding: EdgeInsets.symmetric(
//               horizontal: 16, vertical: 12),
//             child: SingleChildScrollView(
//               child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CustomTextField(
//                   controller: controller.search,
//                   hintText: 'Search job title or keyword ',
//                   prefixIcon: Icon(Icons.search),
//                 ),
//                 SizedBox(height: 12.h),
//
//                 // Filter Buttons
//                 Obx(() => SizedBox(
//                   height: 35,
//                   child: ListView.separated(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: controller.filterTypes.length,
//                     separatorBuilder: (_, __) => SizedBox(width: 8),
//                     itemBuilder: (_, index) {
//                       return GestureDetector(
//                         onTap: () {
//                           controller.currentPage.value = index;
//                           controller.pageController.jumpToPage(index);
//                         },
//                         child: Container(
//                           padding: EdgeInsets.symmetric(horizontal: 12),
//                           decoration: BoxDecoration(
//                             color: controller.currentPage.value == index
//                                 ? AppColors.custom_blue
//                                 : Colors.white,
//                             border: Border.all(color: AppColors.custom_blue),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Center(
//                             child: CustomText(
//                               text: controller.filterTypes[index],
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w400,
//                               color: controller.currentPage.value == index
//                                   ? Colors.white
//                                   : AppColors.custom_blue,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 )),
//
//                 SizedBox(height: 12.h),
//
//                 // PageView with job results
//                 Obx(() => SizedBox(
//                   height: 300.h, // Adjust height to fit content
//                   child: PageView.builder(
//                     controller: controller.pageController,
//                     itemCount: controller.jobsSystemsModel.length,
//                     onPageChanged: (index) {
//                       controller.currentPage.value = index;
//                     },
//                     itemBuilder: (_, index) {
//                       final jobs = controller.jobsSystemsModel[index];
//                       return GridView.builder(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 4,
//                           crossAxisSpacing: 4,
//                           childAspectRatio: 2.7,
//                         ),
//                         itemCount: jobs.length,
//                         itemBuilder: (context, jobIndex) {
//                           final job = jobs[jobIndex];
//                           return Container(
//                             padding: EdgeInsets.symmetric(horizontal: 6),
//                             decoration: BoxDecoration(
//                               color: AppColors.white,
//                               border: Border.all(color: AppColors.custom_blue, width: 1),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Row(
//                               children: [
//                                 CustomText(
//                                   text: job.title ?? '',
//                                   fontSize: 12.sp,
//                                   fontWeight: FontWeight.w400,
//                                   color: AppColors.custom_blue,
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 )),
//
//                 SizedBox(height: 12.h),
//
//                 Obx(() => CustomText(
//                   text: "${controller.jobsSystemsModel[controller.currentPage.value].length} results",
//                   fontSize: 14.sp,
//                   color: Color(0xff555A5F),
//                   fontWeight: FontWeight.w400,
//                 )),
//               ],
//             )
//             ),
//           )),
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shuroo/core/utils/constants/app_colors.dart';
// import 'package:shuroo/core/utils/constants/app_sizer.dart';
// import '../../../../core/common/widgets/custom_back_button.dart';
// import '../../../../core/common/widgets/custom_text.dart';
// import '../../../../core/common/widgets/custom_text_field.dart';
// import '../../controller/search_result_controller.dart';
//
// class SearchResultScreen extends StatelessWidget {
//   SearchResultScreen({super.key});
//
//   final SearchResultController controller = Get.put(SearchResultController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.scaffoldBackgroundColor,
//       appBar: AppBar(
//         leading: CustomBackButton(),
//         title: CustomText(
//           text: 'Job Result',
//           fontSize: 20.sp,
//           fontWeight: FontWeight.w600,
//           color: AppColors.textPrimary,
//         ),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomTextField(
//               controller: controller.search,
//               hintText: 'Search job title or keyword',
//               prefixIcon: Icon(Icons.search),
//             ),
//             SizedBox(height: 12.h),
//
//             GridView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4,
//                 crossAxisSpacing: 4, // Horizontal space between items
//                 childAspectRatio: 2.7, // Width / Height ratio
//               ),
//               itemCount: controller.jobsSystemsModel.length,
//               itemBuilder: (context, index) {
//                 final jobsList = controller.jobsSystemsModel[index];
//                 return Container(
//                   padding: EdgeInsets.symmetric(horizontal: 6),
//                   decoration: BoxDecoration(
//                     color: AppColors.white,
//                     border: Border.all(color: AppColors.custom_blue, width: 1),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Row(
//                     children: [
//                       CustomText(
//                         text: jobsList.title!,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                         color: AppColors.custom_blue,
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//
//             SizedBox(height: 12.h),
//
//             CustomText(
//               text: "200 results",
//               fontSize: 14.sp,
//               color: Color(0xff555A5F),
//               fontWeight: FontWeight.w400,
//             ),
//           ],
//         ),
//       ),
//       )
//     );
//   }
// }













// New screen......................................


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/routes/app_routes.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../favorites/controller/favourite_controller.dart';
import '../../controller/search_result_controller.dart';

class SearchResultScreen extends StatelessWidget {
  SearchResultScreen({super.key});

  final favouriteController = Get.find<FavouriteController>();
  final controller = Get.put(SearchResultController());

  final List<String> filters = ['ALL JOB', 'FULLTIME', 'PARTTIME', 'REMOTE', 'HYBRID'];

  // Sample job list
  final List<Map<String, dynamic>> allJobs = [
    {
      'title': 'UI/UX Designer',
      'company': 'Tech Corp',
      'location': 'Dhaka',
      'tags': ['Full Time'],
      'type': 'Full Time',
    },
    {
      'title': 'Backend Developer',
      'company': 'DevHub',
      'location': 'Remote',
      'tags': ['PARTTIME'],
      'type': 'PARTTIME',
    },
    {
      'title': 'Product Manager',
      'company': 'SoftBangla',
      'location': 'Onsite',
      'tags': ['REMOTE'],
      'type': 'REMOTE',
    },
    {
      'title': 'Flutter Developer',
      'company': 'Appify',
      'location': 'Dhaka',
      'tags': ['HYBRID'],
      'type': 'HYBRID',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(title: const Text('Job Listings')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            CustomTextField(
              controller: controller.search,
              hintText: 'Search job title or keyword',
              prefixIcon: Icon(Icons.search),
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
                      onSelected: (_) => controller.setFilter(filter),
                      selectedColor: Colors.blue,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
            )),
            SizedBox(height: 16.h),

            // Job List
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
                                  color: isFav ? Colors.red : AppColors.textPrimary,
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
                                //_buildTag(job.location ?? ''),
                                SizedBox(width: 8.w),
                               // _buildTag(job.industryType ?? ''),
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
                                    Get.toNamed(AppRoute.jobDetailsScreen);
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


  /// Helper widget to build tag container
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


