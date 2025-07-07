import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/post_creation_repost_delete/presentation/widget/custom_repost_screen_card.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../controller/repost_with_throught_screen_controller.dart';

class RepostWithThroughtScreen
    extends GetView<RepostWithThroughtScreenController> {
  const RepostWithThroughtScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // controllerOne.getSinglePost(postId);
    // final updatePost = controllerOne.singlePost.value.data?.data;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() => controller.isLoading.value ||
                  controller.userProfileInfo.value.data == null
              ? CircularProgressIndicator()
              : Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                              controller.userProfileInfo.value.data?.image ==
                                      null
                                  ? ClipOval(
                                      child: Image.asset(
                                        ImagePath.dummyProfilePicture,
                                        fit: BoxFit.fill,
                                        height: 40.h,
                                        width: 40.w,
                                      ),
                                    )
                                  : ClipOval(
                                      child: Image.network(
                                        controller
                                            .userProfileInfo.value.data!.image,
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                              SizedBox(width: 10),
                              CustomText(
                                text: controller
                                        .userProfileInfo.value.data!.name ??
                                    'User Name',
                                fontSize: 18.sp,
                                color: AppColors.textPrimary,
                              )
                            ],
                          ),
                          Obx(() {
                            final isEnable =
                                controller.isPostButtonEnable.value;
                            return InkWell(
                              onTap: isEnable
                                  ? () {
                                      controller.postRepost(controller
                                          .singlePost.value.data!.data!.id
                                          .toString());
                                      AppSnackBar.showSuccess(
                                          'Post Repost Successfully');
                                      Get.back();
                                    }
                                  : null,
                              child: Container(
                                width: 72.0.w,
                                height: 40.0.h,
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
                                decoration: BoxDecoration(
                                  color: isEnable
                                      ? AppColors.custom_blue
                                      : Color(0xffE6E6E7),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Center(
                                  child: CustomText(
                                    text: "Update",
                                    color: isEnable
                                        ? AppColors.white
                                        : Color(0xff8B8E91),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            );
                          })
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextField(
                        maxLine: 3,
                        controller: controller.textController,
                        hintText: "Share your thoughts...",
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Obx(() => controller.singlePost.value.data!.data != null
                          ? CustomRepostScreenCard(
                              context: context,
                              title: controller
                                  .singlePost.value.data!.data!.user!.name
                                  .toString(),
                              icon: controller
                                  .singlePost.value.data!.data!.user!.image
                                  .toString(),
                              organization: controller.singlePost.value.data!
                                      .data!.user!.name ??
                                  "Unknown",
                              content: controller
                                      .singlePost.value.data!.data!.content!
                                      .toString() ??
                                  '',
                              imageAsset: controller.singlePost.value.data!
                                      .data!.image!.isNotEmpty
                                  ? controller
                                      .singlePost.value.data!.data!.image!.first
                                      .toString()
                                  : "",
                            )
                          : SizedBox())
                    ],
                  ),
                )),
        ),
      ),
    );
  }
}
