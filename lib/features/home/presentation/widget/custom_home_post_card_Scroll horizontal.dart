import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/common/widgets/custom_text_field.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/routes/app_routes.dart';
import 'package:shuroo/features/home/controller/home_controller.dart';
import 'package:shuroo/features/home/presentation/widget/comment_body.dart';
import 'package:shuroo/features/post_creation_repost_delete/presentation/widget/custom_popup.dart';

class UnifiedPostCard extends StatelessWidget {
  final String? dp;
  final String? organization;
  final String? timeAgo;
  final String? title;
  final String? description;
  final String? hashtags;
  final String? image;
  final List<String>? imageList;
  final String? react;
  final String? comment;
  final String? repost;
  final String? send;
  final bool isHorizontalScroll;
  final bool isCommentEnabled;

  const UnifiedPostCard({
    super.key,
    this.dp,
    this.organization,
    this.timeAgo,
    this.title,
    this.description,
    this.hashtags,
    this.image,
    this.imageList,
    this.react,
    this.comment,
    this.repost,
    this.send,
    this.isHorizontalScroll = false,
    this.isCommentEnabled = false, required event,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Container(
      margin: EdgeInsets.only(bottom: 10),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Row(
                  children: [
                    if (dp != null)
                      ClipOval(
                        child: Image.asset(dp!, height: 40.h, width: 40.w, fit: BoxFit.cover),
                      ),
                    SizedBox(width: 5.w),
                    GestureDetector(
                      onTap: () {
                        if (isCommentEnabled) {
                          Get.toNamed(AppRoute.otherUserProfileScreen);
                        } else {
                          Get.toNamed(AppRoute.companyProfileScreen);
                        }
                      },
                      child: Text(
                        organization ?? 'Unknown',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Cabinet Grotesk",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    timeAgo ?? '',
                    style: const TextStyle(color: AppColors.grayText),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          /// Title / Event
          Text(
            title ?? '',
            style: const TextStyle(
              color: AppColors.grayText,
              fontFamily: "Inter",
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 4),

          /// Description
          Text(description ?? ''),

          const SizedBox(height: 4),

          /// Hashtags
          Text(
            hashtags ?? '',
            style: const TextStyle(color: Colors.blue),
          ),

          const SizedBox(height: 8),

          /// Image(s)
          if (isHorizontalScroll && imageList != null && imageList!.isNotEmpty)
            SizedBox(
              height: 163.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageList!.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 123.w,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imageList![index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            )
          else if (image != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image!,
                fit: BoxFit.cover,
                height: 151.h,
                width: double.infinity,
              ),
            ),

          const SizedBox(height: 8),

          /// Action Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: react ?? "\u2764\uFE0F 0 likes",
                fontSize: 14,
                color: AppColors.grayText,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (isCommentEnabled) {
                        showModalBottomSheet(
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...controller.commentList.map(
                                      (row) => commentBody(controller, row, context),
                                    ),
                                    SizedBox(height: 32.h),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
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
                                        SizedBox(width: 7.w),
                                        Flexible(
                                          flex: 7,
                                          child: Obx(() => CustomTextField(
                                                onTapOutside: (c) {
                                                  controller.addComment.value = true;
                                                  FocusScope.of(context).unfocus();
                                                },
                                                controller: controller.commentTEController.value,
                                                hintText: controller.addComment.value
                                                    ? "Add your comment..."
                                                    : "Add a reply...",
                                                focusNode: controller.controllerNode,
                                                radius: 50,
                                                suffixIcon:
                                                    controller.commentTEController.value.text.isNotEmpty
                                                        ? Padding(
                                                            padding:
                                                                EdgeInsets.symmetric(horizontal: 4.w),
                                                            child: GestureDetector(
                                                              onTap: () {
                                                                if (controller.addComment.value) {
                                                                  controller.addCommentFunction(
                                                                    controller.commentTEController.value.text,
                                                                  );
                                                                } else {
                                                                  controller.addReplyFunction(
                                                                    controller.commentTEController.value.text,
                                                                  );
                                                                }
                                                                FocusScope.of(context).unfocus();
                                                              },
                                                              child: Image.asset(
                                                                IconPath.sendButton,
                                                                height: 24.h,
                                                                width: 24.w,
                                                              ),
                                                            ),
                                                          )
                                                        : const SizedBox(),
                                              )),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: Image.asset(IconPath.comments, height: 16, width: 16),
                  ),
                  const SizedBox(width: 2),
                  CustomText(
                    text: comment ?? '0 comments',
                    fontSize: 14,
                    color: AppColors.grayText,
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  if (isCommentEnabled) {
                    showRepostPopup(context);
                  }
                },
                child: Row(
                  children: [
                    Image.asset(IconPath.reposts, height: 16, width: 16),
                    const SizedBox(width: 2),
                    CustomText(
                      text: repost ?? 'Repost',
                      fontSize: 14,
                      color: AppColors.grayText,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Image.asset(IconPath.send, height: 16, width: 16),
                  const SizedBox(width: 2),
                  CustomText(
                    text: send ?? 'Send',
                    fontSize: 14,
                    color: AppColors.grayText,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
