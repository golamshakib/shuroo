import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/post_creation_repost_delete/controller/my_all_post_screen_controller.dart';
import 'package:shuroo/features/post_creation_repost_delete/presentation/widget/custom_repost_screen_card.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../controller/repost_with_throught_screen_controller.dart';

class RepostWithThroughtScreen extends StatelessWidget {
  final String postId;

  RepostWithThroughtScreen({super.key, required this.postId});
  final controller = Get.put(RepostWithThroughtScreenController());
  final controllerOne = Get.find<MyAllPostScreenController>();

  @override
  Widget build(BuildContext context) {
    controllerOne.getSinglePost(postId);
    final updatePost = controllerOne.singlePost.value.data?.data;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    IconPath.cancle,
                    height: 40,
                    width: 40,
                  ),
                ),
                Image.network(
                  controllerOne.singlePost.value.data?.data?.user?.image ??
                      ImagePath.dummyProfilePicture,
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10),
                CustomText(
                  text: controllerOne.singlePost.value.data?.data?.user?.name ??
                      '',
                  fontSize: 18,
                  color: AppColors.textPrimary,
                )
              ],
            ),
            InkWell(
              onTap: () {
                controller.postRepost(updatePost!.id.toString());
              },
              child: Container(
                width: 72.0.w,
                height: 40.0.h,
                padding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
                decoration: BoxDecoration(
                  color: AppColors.custom_blue,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Center(
                  child: CustomText(
                    text: AppText.post,
                    color: AppColors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                Container(
                  child: CustomTextField(
                    maxLine: 3,
                    controller: controller.textController,
                    hintText: "Share your thoughts...",
                  ),
                ),
                Obx(() {
                  final post = controllerOne.singlePost.value.data?.data;
                  if (post == null) return SizedBox();

                  return CustomRepostScreenCard(
                    context: context,
                    icon: post.user?.image ?? ImagePath.dummyProfilePicture,
                    organization: post.user?.name ?? "Unknown",
                    content: post.content?.toString() ?? '',
                    imageAsset:
                        post.image?.isNotEmpty == true ? post.image!.first : '',
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
