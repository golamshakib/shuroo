

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';

import '../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../../home/presentation/widget/custom_home_post_card.dart';
import '../../controller/company_profile_screen_controller.dart';
import '../../controller/other_user_profile_screen_controller.dart';
import '../widget/job_tabbar_card.dart';
import '../widget/tabbar_about_item.dart';

class CompanyProfileScreen extends StatelessWidget {
  CompanyProfileScreen({super.key});

  
  final controllerOne = Get.put(OtherUserProfileScreenControllar());
  final controller = Get.put(CompanyProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Obx(() {
            final user = controllerOne.othersUserProfile.value.data;
            return CustomText(
              text: user?.name ?? 'User Name',
              fontSize: 20.sp,
              color: AppColors.primaryTextColor,
            );
          }),
        ),
        body: Obx(() {
          final user = controllerOne.othersUserProfile.value.data;

          if (user == null) {
            return Center(
                child: SpinKitFadingCircle(
                  color: AppColors.primary,
                  size: 50.h,
                )
            );
          }

          return Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 39, left: 16, right: 16),
                child: Column(
                  children: [
                    Image.network(
                      user.image ?? ImagePath.dummyProfilePicture,
                      height: 120.h,
                      width: 120.w,
                      errorBuilder: (context, object, stacktrace){
                        return Image.asset(
                          ImagePath.dummyProfilePicture,
                          height: 120.h,
                          width: 120.w,

                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomText(
                      text: user.name ?? 'User Name',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                    CustomText(
                      text: user.email ?? 'youremail@gmail.com',
                      fontSize: 16,
                      color: AppColors.secondaryTextColor,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: CustomSubmitButton(
                              text: ' Message', onTap: () {}),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffB0E4FD)),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Image.asset(
                                IconPath.share,
                                height: 24.h,
                                width: 24.w,
                                color: Color(0xff004769),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 3),
                      child: TabBar(
                        controller: controller.tabController,
                        indicatorColor: AppColors.custom_blue,
                        labelColor: AppColors.custom_blue,
                        unselectedLabelColor: Colors.grey,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: const [
                          Tab(text: 'Post'),
                          Tab(text: 'About'),
                          Tab(text: 'Jobs'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    user.post == null || user.post!.isEmpty
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: CustomText(
                                text: 'No posts available.',
                                fontSize: 16.sp,
                                color: AppColors.secondaryTextColor,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: user.post!.length,
                            itemBuilder: (context, index) {
                              final post = user.post![index];
                              final firstImage =
                                  (post.image?.isNotEmpty ?? false)
                                      ? post.image!.first
                                      : null;

                              return Container(
                                margin: EdgeInsets.only(top: 16, left: 16),
                                child: PostCard(
                                  context: context,
                                  likedByME: false.obs,
                                  icon: post.user?.logoImage ?? IconPath.icon_1,
                                  organization:
                                      post.user?.name ?? 'Company Name',
                                  likeCount: 2.toString().obs,
                                  commentCount: 2.toString(),
                                  content: post.content ?? '',
                                  imageAsset: firstImage ?? '',
                                ),
                              );
                            },
                          ),
                    SingleChildScrollView(child: getAboutItem()),
                    user.job == null || user.job!.isEmpty
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: CustomText(
                                text: 'No jobs available.',
                                fontSize: 16.sp,
                                color: AppColors.secondaryTextColor,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: user.job!.length,
                            itemBuilder: (context, index) {
                              final job = user.job![index];
                              return Container(
                                margin: EdgeInsets.only(top: 16, left: 16),
                                child: JobTabBarCard(
                                  title: job.name ?? '',
                                  company:
                                      job.company?.name ?? 'Unknown Company',
                                  tags: job.mustSkills ?? [],
                                  location: job.location ?? 'Unknown Location',
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
