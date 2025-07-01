import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/app_texts.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';
import 'package:shuroo/features/post_creation_repost_delete/controller/my_all_post_screen_controller.dart';
import 'package:shuroo/features/profile/controller/profile_information_controller.dart';

import '../../../home/presentation/widget/custom_home_post_card.dart';
import '../widget/custom_pupup_edit_post.dart';

class MyAllPostScreen extends StatelessWidget {
  MyAllPostScreen({super.key});

  final controller = Get.find<MyAllPostScreenController>();
  final controllerOne = Get.find<ProfileInformationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        body: SafeArea(
            child: Container(
                margin: EdgeInsets.only(left: 16, right: 10, top: 10),
                child: Column(children: [
                  Row(
                    children: [
                      InkWell(
                        child: Image.asset(IconPath.back_arrow),
                        onTap: () {
                          Get.back();
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Obx(() {
                        final user = controllerOne.userProfile.value.data;

                        return CustomText(
                          text: user?.name ?? 'User Name',
                          fontSize: 20,
                          color: AppColors.primaryTextColor,
                        );
                      }),
                    ],
                  ),
                  Obx(() {
                    final postWrapper = controller.getUserPost.value.data;
                    final posts = postWrapper?.data;

                    if (posts == null || posts.isEmpty) {
                      return Center(
                        child: CustomText(
                          text: 'Post Not Found',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryTextColor,
                        ),
                      );
                    }

                    return Expanded(
                      child: ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          final userPost = posts[index];

                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(4, 4),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            margin: const EdgeInsets.only(top: 16),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          IconPath.man,
                                          height: 24.h,
                                          width: 24.w,
                                        ),
                                        SizedBox(width: 5.w),
                                        CustomText(
                                          text:
                                              "${userPost.user?.name ?? "Unknown"} reposted this",
                                          fontSize: 14,
                                          color: AppColors.primaryTextColor,
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showPostEditePopup(context);
                                      },
                                      child: Image.asset(IconPath.dod),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: PostCard(
                                    context: context,
                                    icon:
                                        userPost.user?.image ?? IconPath.icon_1,
                                    organization: AppText.wildWorld,
                                  //  title: AppText.campus_Event,
                                    content: userPost.content ?? "",
                                    imageAsset:
                                        (userPost.image?.isNotEmpty ?? false)
                                            ? userPost.image!.first
                                            : ImagePath.img_video,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ]))));
  }
}
