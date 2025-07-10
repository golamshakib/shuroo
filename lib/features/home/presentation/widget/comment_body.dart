

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';
import 'package:shuroo/features/home/controller/home_controller.dart';
import 'package:shuroo/routes/app_routes.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../data/get_post_comment_model.dart';

Widget commentBody(HomeController controller, Nifat row, RxBool likedByMe, RxInt likeCount,BuildContext context){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      /// Main comment
      GestureDetector(
        onTap: (){
          if(row.userId! == controller.controllerOne.userProfile.value.data!.id){
            controller.commentTEController.value.text = row.comment!;
            showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                builder: (context){
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                                context: context,
                                backgroundColor: AppColors.white,
                                builder: (context){
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: ClipOval(
                                                child: controller
                                                    .controllerOne
                                                    .userProfile
                                                    .value
                                                    .data!
                                                    .image ==
                                                    null
                                                    ? Image.asset(
                                                  ImagePath
                                                      .dummyProfilePicture,
                                                  height: 40.h,
                                                  width: 40.w,
                                                  fit:
                                                  BoxFit.fill,
                                                )
                                                    : Image.network(
                                                  controller
                                                      .controllerOne
                                                      .userProfile
                                                      .value
                                                      .data!
                                                      .image,
                                                  height: 40.h,
                                                  width: 40.w,
                                                  fit: BoxFit.fill,
                                                )),
                                          ),
                                          SizedBox(width: 7.w,),
                                          Flexible(
                                            flex: 7,
                                            child: Obx(() =>
                                                CustomTextField(
                                                    onTapOutside: (c){
                                                      controller.addComment.value = true;
                                                      controller.commentTEController.value.clear();
                                                      FocusScope.of(context).unfocus();
                                                    },
                                                    controller: controller.commentTEController.value,
                                                    hintText: "Edit your comment...",
                                                    focusNode: controller.controllerNode,
                                                    radius: 50,
                                                    suffixIcon: Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                                                        child: GestureDetector(
                                                          onTap: () async{
                                                            controller.requestToEditComment(row.postId!, row.id!);
                                                          },
                                                          child: Image.asset(IconPath.sendButton, height: 24.h, width: 24.w,),
                                                        )
                                                    )
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            );
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(IconPath.editIcon),
                              SizedBox(width: 6.w,),
                              CustomText(text: "Edit comment", fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color(0xFF353A40),)
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h,),
                        GestureDetector(
                          onTap: (){
                            showDialog(
                                context: context,
                                builder: (context){
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    actionsAlignment: MainAxisAlignment.center,
                                    actionsPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                                    actions: [
                                      Center(child: CustomText(text: "Delete Comment?", fontWeight: FontWeight.w600, fontSize: 24.sp, textAlign: TextAlign.center,)),
                                      SizedBox(height: 8.h,),
                                      CustomText(text: "Once deleted, your comment will be permanently removed.", fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.textSecondary, textAlign: TextAlign.center,),
                                      SizedBox(height: 8.h,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                  backgroundColor: const Color(0xFFE6E6E7),
                                                  side: BorderSide.none
                                              ),
                                              onPressed: (){
                                                Get.back();
                                              },
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: Center(child: CustomText(text: "Cancel", fontWeight: FontWeight.w500, fontSize: 15.sp, color: AppColors.textSecondary,)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 11.w,),
                                          Flexible(
                                            flex: 1,
                                            child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                backgroundColor: const Color(0xFF01A8F9),
                                                side: BorderSide.none,
                                              ),
                                              onPressed: () async{
                                                log("${row.postId!} & ${row.id}");
                                                await controller.deletedComment(row.postId!, row.id!);
                                                //row['replies'].remove(subRow);
                                              },
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: Center(child: CustomText(text: "Delete", fontWeight: FontWeight.w500, fontSize: 15.sp, color: AppColors.white,)),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  );
                                }
                            );
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(IconPath.binIcon),
                              SizedBox(width: 6.w,),
                              CustomText(text: "Delete comment", fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color(0xFF353A40),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
            );
          }
          else{
            log("not same");
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: row.user!.image == null ?
                        Image.asset(ImagePath.dummyProfilePicture, height: 32.h, width: 32.w, fit: BoxFit.fill,) :
                        Image.network(row.user!.image!, height: 32.h, width: 32.w, fit: BoxFit.fill,)
                      ),
                      SizedBox(width: 6.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(text: row.user!.name.toString(), fontWeight: FontWeight.w600, ),
                          //CustomText(text: row['designation'], fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                        ],
                      )
                    ],
                  ),
                  CustomText(text: DateFormat("dd MMM").format(row.updatedAt!), fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.textSecondary,)
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(text: row.comment.toString(), fontWeight: FontWeight.w400, textOverflow: TextOverflow.ellipsis, maxLines: 4,),
                    SizedBox(height: 12.h,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async{
                            likedByMe.value = !likedByMe.value;
                            if (!likedByMe.value) {
                              likeCount = likeCount - 1;
                            } else {
                              likeCount = likeCount + 1;
                            }
                            if (!await controller.changeLikeStatus(row.id!)) {
                              likedByMe.value = !likedByMe.value;
                              if (!likedByMe.value) {
                                likeCount = likeCount - 1;
                              } else {
                                likeCount = likeCount + 1;
                              }
                            }
                          },
                          child: Obx(() => CustomText(text: "Like", fontWeight: FontWeight.w400, fontSize: 12.sp, color: likedByMe.value ? AppColors.primary : AppColors.textSecondary,)),
                        ),
                        SizedBox(width: 8.w,),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoute.reactionScreen);
                          },
                          child: Obx(() =>
                              CustomText(text: likeCount.value.toString(), fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,)
                          ),
                        ),
                        SizedBox(width: 12.w,),
                        CustomText(text: "|", fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                        SizedBox(width: 12.w,),
                        GestureDetector(
                          onTap: (){
                            controller.addComment.value = false;
                            controller.commentIDToReply.value = row.id!;
                            log(controller.commentIDToReply.value);
                            FocusScope.of(context).requestFocus(controller.controllerNode);
                          },
                          child: CustomText(text: "Reply", fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                        ),
                        SizedBox(width: 8.w,),
                        CustomText(text: row.count!.replyComment.toString(), fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      /// Replies

      Padding(
        padding: EdgeInsets.only(left: 38.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Adding the replies

            if(row.count!.replyComment != 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...row.replyComment!.map((reply) =>
                      Padding(
                        padding: EdgeInsets.only(top: 4.h),
                        child: GestureDetector(
                          onTap: (){
                            if(reply.userId! == controller.controllerOne.userProfile.value.data!.id){
                              controller.commentTEController.value.text = reply.replyComment!;
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.white,
                                  builder: (context){
                                    return Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              showModalBottomSheet(
                                                  context: context,
                                                  backgroundColor: AppColors.white,
                                                  builder: (context){
                                                    return Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Flexible(
                                                            flex: 1,
                                                            child: ClipOval(
                                                              child: Image.asset(ImagePath.dummyProfilePicture, height: 40.h, width: 40.w,),
                                                            ),
                                                          ),
                                                          SizedBox(width: 7.w,),
                                                          Flexible(
                                                            flex: 7,
                                                            child: Obx(() =>
                                                                CustomTextField(
                                                                    onTapOutside: (c){
                                                                      controller.addComment.value = true;
                                                                      controller.commentTEController.value.clear();
                                                                      FocusScope.of(context).unfocus();
                                                                    },
                                                                    controller: controller.commentTEController.value,
                                                                    hintText: "Edit your reply...",
                                                                    focusNode: controller.controllerNode,
                                                                    radius: 50,
                                                                    suffixIcon: Padding(
                                                                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                                                                        child: GestureDetector(
                                                                          onTap: (){
                                                                            controller.requestToEditReply(row.postId!, reply.id!);
                                                                          },
                                                                          child: Image.asset(IconPath.sendButton, height: 24.h, width: 24.w,),
                                                                        )
                                                                    )
                                                                )
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }
                                              );
                                            },
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(IconPath.editIcon),
                                                SizedBox(width: 6.w,),
                                                CustomText(text: "Edit reply", fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color(0xFF353A40),)
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 16.h,),
                                          GestureDetector(
                                            onTap: (){
                                              showDialog(
                                                  context: context,
                                                  builder: (context){
                                                    return AlertDialog(
                                                      backgroundColor: Colors.white,
                                                      actionsAlignment: MainAxisAlignment.center,
                                                      actionsPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                                                      actions: [
                                                        Center(child: CustomText(text: "Delete Reply?", fontWeight: FontWeight.w600, fontSize: 24.sp, textAlign: TextAlign.center,)),
                                                        SizedBox(height: 8.h,),
                                                        CustomText(text: "Once deleted, your reply will be permanently removed.", fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.textSecondary, textAlign: TextAlign.center,),
                                                        SizedBox(height: 8.h,),
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Flexible(
                                                              flex: 1,
                                                              child: OutlinedButton(
                                                                style: OutlinedButton.styleFrom(
                                                                    backgroundColor: const Color(0xFFE6E6E7),
                                                                    side: BorderSide.none
                                                                ),
                                                                onPressed: (){
                                                                  Get.back();
                                                                },
                                                                child: SizedBox(
                                                                  width: double.infinity,
                                                                  child: Center(child: CustomText(text: "Cancel", fontWeight: FontWeight.w500, fontSize: 15.sp, color: AppColors.textSecondary,)),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(width: 11.w,),
                                                            Flexible(
                                                              flex: 1,
                                                              child: OutlinedButton(
                                                                style: OutlinedButton.styleFrom(
                                                                  backgroundColor: const Color(0xFF01A8F9),
                                                                  side: BorderSide.none,
                                                                ),
                                                                onPressed: () async{
                                                                  log("${row.postId!} & ${reply.id}");
                                                                  await controller.deletedReply(row.postId!, reply.id!);
                                                                },
                                                                child: SizedBox(
                                                                  width: double.infinity,
                                                                  child: Center(child: CustomText(text: "Delete", fontWeight: FontWeight.w500, fontSize: 15.sp, color: AppColors.white,)),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    );
                                                  }
                                              );
                                            },
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(IconPath.binIcon),
                                                SizedBox(width: 6.w,),
                                                CustomText(text: "Delete reply", fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color(0xFF353A40),)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                              );
                            }else{
                              log("not yours");
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Divider(
                                    thickness: 0.5.h,
                                    color: AppColors.textSecondary,
                                    height: .5.h,
                                  ),
                                ),
                                SizedBox(height: 16.h,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        ClipOval(
                                            child: row.user!.image == null ?
                                            Image.asset(ImagePath.dummyProfilePicture, height: 32.h, width: 32.w, fit: BoxFit.fill,) :
                                            Image.network(reply.user!.image!, height: 32.h, width: 32.w, fit: BoxFit.fill,)
                                        ),
                                        SizedBox(width: 6.w,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            CustomText(text: reply.user!.name.toString(), fontWeight: FontWeight.w600, ),
                                            //CustomText(text: subRow['designation'], fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.textSecondary,),
                                          ],
                                        )
                                      ],
                                    ),
                                    CustomText(text: DateFormat("dd MMM").format(reply.updatedAt!), fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.textSecondary,)
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 12.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CustomText(text: reply.replyComment.toString(), fontWeight: FontWeight.w400, textOverflow: TextOverflow.ellipsis, maxLines: 4,),
                                      SizedBox(height: 12.h,),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                  )
                ],
              )
          ],
        ),
      ),
      SizedBox(height: 12.h,)
    ],
  );
}