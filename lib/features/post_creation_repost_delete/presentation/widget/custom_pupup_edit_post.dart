import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custpm_popup.dart';
import 'package:shuroo/features/home/controller/home_controller.dart';
import 'package:shuroo/features/post_creation_repost_delete/controller/my_all_post_screen_controller.dart';
import 'package:shuroo/features/post_creation_repost_delete/presentation/screen/repost_with_throught_screen.dart';
import 'package:shuroo/features/post_creation_repost_delete/presentation/widget/share_post_popup.dart';
import 'package:shuroo/features/profile/controller/profile_information_controller.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/icon_path.dart';

void showPostEditePopup(BuildContext context, id) {
  final controller = Get.find<MyAllPostScreenController>();
  final controllerFour = Get.find<HomeController>();
  final controllerTwo = Get.find<ProfileInformationController>();

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _popupOption(
              icon: IconPath.edit,
              title: AppText.edtPost,
              onTap: () {
                print(" Get.to(() => RepostWithThroughtScreen());$id}");
                ConfirmPopup.show(
                  title: "Edit Post?",
                  message1: 'Are you want to sure edit on this post?',
                  confirmText: "Edit",
                  cancelText: "Cancel",
                  onConfirm: () {
                    // Get.to(() => RepostWithThroughtScreen(postId: id));
                  },
                );
              },
            ),
            SizedBox(height: 20),
            _popupOption(
              icon: IconPath.delete,
              title: AppText.deletePost,
              onTap: () {
                // Replace 0 with the correct index of the post you want to delete
                //final currentPostId = controller.getUserPost.value.data?.data?[1].id;
                ConfirmPopup.show(
                    title: "Delete Post?",
                    message1: AppText.areYou,
                    message2: AppText.removedThis,
                    confirmText: "Delete",
                    cancelText: "Cancel",
                    onConfirm: () {
                      // if (currentPostId != null) {
                      controller.deletePost(id);
                      print(
                          "=================================================$id");
                    });
              },
            ),
          ],
        ),
      );
    },
  );
}

Widget _popupOption({
  required String icon,
  required String title,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(icon),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                fontSize: 14,
                color: AppColors.secondaryTextColor,
              ),
              SizedBox(height: 4),
            ],
          ),
        ),
      ],
    ),
  );
}
