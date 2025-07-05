import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/company_user%20_profile/controller/other_user_profile_screen_controller.dart';
import '../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../../home/presentation/widget/custom_home_post_card.dart' hide CustomText;
import '../../../message/presentation/screens/chat_details_screen.dart';
import '../widget/other_user_resume_widget.dart';

class OtherUserProfileScreen extends StatelessWidget {
  OtherUserProfileScreen({super.key});

  final controller = Get.put(
    OtherUserProfileScreenControllar(),
  );

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final user = controller.othersUserProfile.value.data;

      if (user == null) {
        return Scaffold(
          appBar: AppBar(
            title: CustomText(
              text: "Loading...",
              fontSize: 20,
              color: AppColors.primaryTextColor,
            ),
          ),
          body: const Center(child: CircularProgressIndicator()),
        );
      }

      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: CustomText(
              text: user.name ?? "User Name",
              fontSize: 20,
              color: AppColors.primaryTextColor,
            ),
          ),
          body: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 39, left: 16, right: 16),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.network(
                        user.image ?? '',
                        height: 120.h,
                        width: 120.w,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Image.asset(
                          ImagePath.dummyProfilePicture,
                          height: 120.h,
                          width: 120.w,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomText(text: user.name ?? "User Name", fontSize: 20),
                    CustomText(
                      text: user.email ?? "youremail@gmail.com",
                      fontSize: 16,
                      color: AppColors.secondaryTextColor,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: CustomSubmitButton(
                            text: 'Message',
                            onTap: () {
                              log(user.id.toString());
                              log(user.name.toString());
                              log(user.image.toString());
                              Get.to(() => ChatInboxScreen(receiverId: user.id!, userName: user.name!, image: user.image.toString(), ));
                            },
                          ),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            IconPath.share1,
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const TabBar(
                indicatorColor: AppColors.custom_blue,
                labelColor: AppColors.custom_blue,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(text: 'Post'),
                  Tab(text: 'About'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(top: 16, left: 16),
                          child: PostCard(
                            context: context,
                            likedByME: false.obs,
                            icon: IconPath.icon_1,
                            organization: AppText.wildWorld,
                            likeCount: '2'.obs,
                            commentCount: '2',
                            content: AppText.the_annualCareer,
                            imageAsset: "",
                          ),
                        );
                      },
                    ),
                    ResumeScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
