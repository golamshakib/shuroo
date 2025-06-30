import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/app_texts.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/features/home/controller/home_controller.dart';
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
        title: GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Image.asset(
                IconPath.icon_pro,
                height: 40.h,
                width: 40.w,
              ),
              SizedBox(width: 10.w),
              const Text(AppText.hi_rochelle),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to notifications screen
              // Get.toNamed(AppRoute.notificationScreen);
            },
            icon: const Icon(Icons.notifications_none_outlined),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Obx(() {
          if (controller.postDataList.isEmpty) {
            return const Center(child: Text("No posts found"));
          }

          return ListView.builder(
            itemCount: controller.postDataList.length,
            itemBuilder: (context, index) {
              final post = controller.postDataList[index];

              final String? firstImage =
                  post.image.isNotEmpty ? post.image.first : null;
              return PostCard(
                icon: firstImage ?? IconPath.icon_pro,
                title: post.content,
                content: post.content,
                organization: post.user.name,
                imageAsset: firstImage ?? IconPath.icon_pro,
                context: context,
              );
            },
          );
        }),
      ),
    );
  }
}
