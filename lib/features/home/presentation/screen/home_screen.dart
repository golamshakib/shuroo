import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';
import 'package:shuroo/features/home/controller/home_controller.dart';
import 'package:shuroo/routes/app_routes.dart';
import '../widget/custom_drower.dart';
import '../widget/custom_home_post_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      drawer: CustomDrower(),
      appBar: AppBar(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          title: Obx(() {
            final user = controller.controllerOne.userProfile.value.data;
            return GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Image.asset(
                    user?.image ?? ImagePath.dummyProfilePicture,
                    height: 40.h,
                    width: 40.w,
                  ),
                  SizedBox(width: 10.w),
                  CustomText(
                    text: "Hi, ${user?.name!.split(" ").first ?? 'User Name'}",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            );
          }),
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(AppRoute.notificationScreen);
                },
                icon: const Icon(Icons.notifications_none_outlined)),
            SizedBox(width: 16)
          ]),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Obx(() {
          if (controller.postDataList.isEmpty) {
            return const Center(
                child: CircularProgressIndicator(color: Color(0xFF01A8F9)));
          }

          return RefreshIndicator(
              onRefresh: controller.refreshPostList,
              displacement: 50,
              color: AppColors.white,
              backgroundColor: AppColors.customBlue,
              child: ListView.builder(
                itemCount: controller.postDataList.length,
                itemBuilder: (context, index) {
                  final post = controller.postDataList[index];

                  final String? firstImage =
                      post.image?.isNotEmpty == true ? post.image!.first : null;
                  return PostCard(
                    icon: firstImage ?? IconPath.icon_pro,
                    content: post.content!,
                    postId: post.id,
                    likedByME: post.like!
                        .any((element) =>
                            element.userId ==
                            controller.controllerOne.userProfile.value.data!.id
                                .toString())
                        .obs,
                    organization: post.user!.name!,
                    imageAsset: firstImage ?? "",
                    likeCount: post.count != null
                        ? post.count!.like.toString().obs
                        : "0".obs,
                    commentCount: post.count != null
                        ? post.count!.comment.toString()
                        : "0",
                    context: context,
                    role: post.user?.role?.toString() ?? "USER",

                    navigateClick: () {
                      print("Tapped role: ${post.user?.role} =======================");
                      final userId = post.user?.id?.toString();
                      final role = post.user?.role?.toString();

                      if (userId == null) {
                        print("User ID is null");
                        return;
                      }

                      if (role == 'USER') {
                        Get.toNamed(AppRoute.otherUserProfileScreen,
                            arguments: {"userId": userId, "role": role});
                      } else if (role == 'COMPANY') {
                        Get.toNamed(AppRoute.companyProfileScreen,
                            arguments: {"userId": userId, "role": role});
                      }
                    },
                  );
                },
              ));
        }),
      ),
    );
  }
}
