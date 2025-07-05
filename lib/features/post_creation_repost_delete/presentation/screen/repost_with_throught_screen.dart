import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/post_creation_repost_delete/presentation/widget/custom_repost_screen_card.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/repost_with_throught_screen_controller.dart';

class RepostWithThroughtScreen extends StatelessWidget {
  RepostWithThroughtScreen({super.key});
  RepostWithThroughtScreenController _controller =
      Get.put(RepostWithThroughtScreenController());

  @override
  Widget build(BuildContext context) {
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
                Image.asset(
                  ImagePath.dummyProfilePicture,
                  height: 40,
                  width: 40,
                ),
                SizedBox(width: 10),
                CustomText(
                  text: AppText.rochelle,
                  fontSize: 18,
                  color: AppColors.textPrimary,
                )
              ],
            ),
            InkWell(
              onTap: () {
                Get.offAll(AppRoute.homeScreen);
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
                )),
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
                        controller: _controller.textController,
                        hintText: "Share your thoughts...")),
                CustomRepostScreenCard(
                  context: context,
                  icon: IconPath.icon_1,
                  organization: AppText.wildWorld,
                  timeAgo: "1w ago",
                  title: AppText.campus_Event,
                  content: AppText.the_annualCareer,
                  imageAsset: ImagePath.img_video,
                  hashtags: AppText.careerFair,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
