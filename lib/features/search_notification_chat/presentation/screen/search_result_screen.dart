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







import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import '../../../../core/common/widgets/custom_back_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../controller/search_result_controller.dart';

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
          color: AppColors.textPrimary,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: controller.search,
              hintText: 'Search job title or keyword',
              prefixIcon: Icon(Icons.search),
            ),
            SizedBox(height: 12.h),

            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 4, // Horizontal space between items
                childAspectRatio: 2.7, // Width / Height ratio
              ),
              itemCount: controller.jobsSystemsModel.length,
              itemBuilder: (context, index) {
                final jobsList = controller.jobsSystemsModel[index];
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.custom_blue, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      CustomText(
                        text: jobsList.title!,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.custom_blue,
                      ),
                    ],
                  ),
                );
              },
            ),

            SizedBox(height: 12.h),

            CustomText(
              text: "200 results",
              fontSize: 14.sp,
              color: Color(0xff555A5F),
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
      )
    );
  }
}













// New screen......................................

//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../controller/search_result_controller.dart';
//
// class SearchResultScreen extends StatelessWidget {
//   SearchResultScreen({super.key});
//
//   final controller = Get.put(SearchResultController());
//
//   final List<String> filters = ['All Jobs', 'Full Time', 'Part Time', 'Hybrid'];
//
//   // Sample job list
//   final List<Map<String, dynamic>> allJobs = [
//     {
//       'title': 'UI/UX Designer',
//       'company': 'Tech Corp',
//       'location': 'Dhaka',
//       'tags': ['Full Time', 'Remote'],
//       'type': 'Full Time',
//     },
//     {
//       'title': 'Backend Developer',
//       'company': 'DevHub',
//       'location': 'Remote',
//       'tags': ['Part Time', 'Node.js'],
//       'type': 'Part Time',
//     },
//     {
//       'title': 'Product Manager',
//       'company': 'SoftBangla',
//       'location': 'Onsite',
//       'tags': ['Hybrid', 'Manager'],
//       'type': 'Hybrid',
//     },
//     {
//       'title': 'Flutter Developer',
//       'company': 'Appify',
//       'location': 'Dhaka',
//       'tags': ['Full Time', 'Mobile'],
//       'type': 'Full Time',
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Job Listings')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Filter Chips
//             Obx(() => SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: filters.map((filter) {
//                   final isSelected = controller.selectedFilter.value == filter;
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 8),
//                     child: ChoiceChip(
//                       label: Text(filter),
//                       selected: isSelected,
//                       onSelected: (_) => controller.setFilter(filter),
//                       selectedColor: Colors.blue,
//                       labelStyle: TextStyle(
//                         color: isSelected ? Colors.white : Colors.black,
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             )),
//             const SizedBox(height: 16),
//
//             // Job List
//             Expanded(
//               child: Obx(() {
//                 final selected = controller.selectedFilter.value;
//                 final filteredJobs = selected == 'All Jobs'
//                     ? allJobs
//                     : allJobs.where((job) => job['type'] == selected).toList();
//
//                 return ListView.builder(
//                   itemCount: filteredJobs.length,
//                   itemBuilder: (context, index) {
//                     final job = filteredJobs[index];
//                     return Card(
//                       margin: const EdgeInsets.only(bottom: 12),
//                       elevation: 2,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // Title + Favorite
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   job['title'],
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 const Icon(Icons.favorite_border),
//                               ],
//                             ),
//                             const SizedBox(height: 4),
//
//                             Text(
//                               job['company'],
//                               style: TextStyle(color: Colors.grey.shade600),
//                             ),
//                             const SizedBox(height: 8),
//
//                             // Tags
//                             Wrap(
//                               spacing: 8,
//                               runSpacing: 8,
//                               children: (job['tags'] as List<String>).map((tag) {
//                                 return Container(
//                                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey.shade200,
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   child: Text(tag, style: const TextStyle(fontSize: 12)),
//                                 );
//                               }).toList(),
//                             ),
//                             const SizedBox(height: 8),
//
//                             // Location + Apply
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   job['location'],
//                                   style: TextStyle(color: Colors.grey.shade600),
//                                 ),
//                                 TextButton(
//                                   onPressed: () {},
//                                   child: Row(
//                                     children: const [
//                                       Text("Apply Now"),
//                                       Icon(Icons.arrow_forward),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


