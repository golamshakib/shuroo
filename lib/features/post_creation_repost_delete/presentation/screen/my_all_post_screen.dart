import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/app_texts.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';

import '../../../home/presentation/widget/custom_home_post_card.dart';
import '../widget/custom_pupup_edit_post.dart';

class MyAllPostScreen extends StatelessWidget {
  const MyAllPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        body: SafeArea(
            child: Container(
          margin: EdgeInsets.only(left: 16, right: 10, top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    child: Image.asset(IconPath.back_arrow),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomText(
                    text: AppText.rechelle,
                    fontSize: 20,
                    color: AppColors.primaryTextColor,
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
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
                      margin: EdgeInsets.only(top: 16),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        IconPath.man,
                                        height: 24.h,
                                        width: 24.w,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      CustomText(
                                        text: " Rochelle reposted this",
                                        fontSize: 14,
                                        color: AppColors.primaryTextColor,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  showPostEditePopup(context);
                                },
                                child: Image.asset(IconPath.dod),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: PostCard(
                              context: context,
                              icon: IconPath.icon_1,
                              organization: AppText.wildWorld,
                            //  timeAgo: "1w ago",
                              title: AppText.campus_Event,
                              content: AppText.the_annualCareer,
                              imageAsset: ImagePath.img_video,
                            //  hashtags: AppText.careerFair,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        )));
  }
}
