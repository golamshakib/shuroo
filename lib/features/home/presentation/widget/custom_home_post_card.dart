import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/common/widgets/custom_text_field.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/app_texts.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';
import 'package:shuroo/features/home/controller/home_controller.dart';
import 'package:shuroo/features/home/presentation/widget/comment_body.dart';
import 'package:shuroo/routes/app_routes.dart';

import '../../../../core/utils/constants/app_colors.dart';

import '../../../post_creation_repost_delete/presentation/widget/custom_popup.dart';

class PostCard extends GetView<HomeController> {
  final String organization;
  final String? postId;
  // final String? timeAgo;
  final String content;
  final String icon;
  final RxBool likedByME;
  final BuildContext context;
  final RxString? likeCount;
  final String commentCount;
  // final String? hashtags;
  final String imageAsset;
  final VoidCallback? navigateClick;
  final String? role;

  const PostCard(
      {super.key,
      required this.organization,
      //  this.timeAgo,
      required this.content,
      this.postId,
      required this.likedByME,
      //  this.hashtags,
      required this.imageAsset,
      required this.icon,
      required this.context,
      this.likeCount,
      required this.commentCount,
      this.navigateClick,
      this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
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
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        icon,
                        width: 24.w,
                        height: 24.h,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            ImagePath.dummyProfilePicture,
                            width: 24.w,
                            height: 24.h,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    GestureDetector(
                        onTap: () {
                          navigateClick!();
                          // print("Tapped role: $role");
                          // // Replace 'userId' below with the actual user ID variable from your data model
                          // final userId = postId; // Example: using postId as userId, change as needed
                          // if (role == 'USER') {
                          //   Get.toNamed(AppRoute.otherUserProfileScreen, arguments: {"userId": userId});
                          // } else if (role == 'COMPANY') {
                          //   Get.toNamed(AppRoute.companyProfileScreen, arguments: {"userId": userId});
                          // } else {
                          //   Get.snackbar(
                          //       "Navigation Error", "Invalid role: $role");
                          // }
                        },
                        child: Text(organization,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Cabinet Grotesk")))
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.topCenter,
                      child: Text('',
                          style: const TextStyle(color: AppColors.grayText)))),
            ],
          ),
          const SizedBox(height: 4),
          Text(content),
          const SizedBox(height: 4),
          Text('', style: const TextStyle(color: Colors.blue)),
          const SizedBox(height: 8),
          if (imageAsset != "")
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageAsset,
                fit: BoxFit.cover,
                height: 151.h,
                width: 341.w,
              ),
            ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 4.w,
                children: [
                  Obx(() => GestureDetector(
                        onTap: () async {
                          likedByME.value = !likedByME.value;
                          if (!likedByME.value) {
                            likeCount!.value =
                                (int.parse(likeCount!.value) - 1).toString();
                          } else {
                            likeCount!.value =
                                (int.parse(likeCount!.value) + 1).toString();
                          }
                          if (!await controller
                              .changeLikeStatus(postId.toString())) {
                            likedByME.value = !likedByME.value;
                            if (!likedByME.value) {
                              likeCount!.value =
                                  (int.parse(likeCount!.value) - 1).toString();
                            } else {
                              likeCount!.value =
                                  (int.parse(likeCount!.value) + 1).toString();
                            }
                          }
                        },
                        child: likedByME.value
                            ? Icon(
                                Icons.favorite_rounded,
                                color: AppColors.primary,
                                size: 18.h,
                              )
                            : Icon(
                                Icons.favorite_border_rounded,
                                color: AppColors.containerBorder,
                                size: 18.h,
                              ),
                      )),
                  Obx(() => CustomText(
                        text: "${likeCount!.value} likes",
                        fontSize: 14,
                        color: AppColors.grayText,
                      )),
                ],
              ),

              /// Nifat's part
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (context) {
                            controller.requestForPostComment(postId!);
                            return Obx(() => controller.loadComment.value
                                ? Center(
                                    child: SpinKitFadingCircle(
                                      color: AppColors.primary,
                                      size: 50.h,
                                    ),
                                  )
                                : controller.getPostCommentInformation.value
                                        .data!.isEmpty
                                    ? Center(
                                        child: CustomText(
                                          text: "No Comments Yet!!",
                                          color: AppColors.textSecondary,
                                        ),
                                      )
                                    : Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.w, vertical: 28.h),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ...controller
                                                  .getPostCommentInformation
                                                  .value
                                                  .data!
                                                  .map((row) => commentBody(
                                                      controller,
                                                      row,
                                                      context)),
                                              SizedBox(
                                                height: 32.h,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    flex: 1,
                                                    child: ClipOval(
                                                      child: Image.asset(
                                                        IconPath.icon_pro,
                                                        height: 40.h,
                                                        width: 40.w,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Flexible(
                                                    flex: 7,
                                                    child:
                                                        Obx(() =>
                                                            CustomTextField(
                                                                onTapOutside:
                                                                    (c) {
                                                                  controller
                                                                      .addComment
                                                                      .value = true;
                                                                  FocusScope.of(
                                                                          context)
                                                                      .unfocus();
                                                                },
                                                                controller:
                                                                    controller
                                                                        .commentTEController
                                                                        .value,
                                                                hintText: controller
                                                                        .addComment
                                                                        .value
                                                                    ? "Add your comment..."
                                                                    : "Add a reply...",
                                                                focusNode:
                                                                    controller
                                                                        .controllerNode,
                                                                radius: 50,
                                                                suffixIcon: controller
                                                                        .commentTEController
                                                                        .value
                                                                        .text
                                                                        .isNotEmpty
                                                                    ? Padding(
                                                                        padding:
                                                                            EdgeInsets.symmetric(horizontal: 4.w),
                                                                        child: GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            if (controller.addComment.value) {
                                                                              print(controller.commentTEController.value.text);
                                                                              controller.addCommentFunction(controller.commentTEController.value.text);
                                                                              FocusScope.of(context).unfocus();
                                                                            } else {
                                                                              controller.addReplyFunction(controller.commentTEController.value.text);
                                                                              FocusScope.of(context).unfocus();
                                                                            }
                                                                          },
                                                                          child:
                                                                              Image.asset(
                                                                            IconPath.sendButton,
                                                                            height:
                                                                                24.h,
                                                                            width:
                                                                                24.w,
                                                                          ),
                                                                        ))
                                                                    : SizedBox())),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ));
                          });
                    },
                    child: Image.asset(
                      IconPath.comments,
                      height: 16,
                      width: 16,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  CustomText(
                    text: "$commentCount comments",
                    fontSize: 14,
                    color: AppColors.grayText,
                  ),
                ],
              ),

              /// Nifat's END OF part
              InkWell(
                onTap: () {
                  showRepostPopup(
                    context,
                  );
                },
                child: Row(
                  children: [
                    Image.asset(
                      IconPath.reposts,
                      height: 16,
                      width: 16,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    const CustomText(
                      text: AppText.repost,
                      fontSize: 14,
                      color: AppColors.grayText,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    IconPath.send,
                    height: 16,
                    width: 16,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  const CustomText(
                    text: "Send",
                    fontSize: 14,
                    color: AppColors.grayText,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
