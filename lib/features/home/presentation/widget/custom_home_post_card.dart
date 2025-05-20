
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/app_texts.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/features/authentication/presentation/screens/login_screen.dart';
import 'package:shuroo/features/company_user%20_profile/presentation/screen/company_profile_screen.dart';

import '../../../../core/utils/constants/app_colors.dart';

import '../../../post_creation_repost_delete/presentation/widget/custom_popup.dart';


class PostCard extends StatelessWidget {
  final String organization;
  final String timeAgo;
  final String title;
  final String content;
  final String icon;
  final BuildContext context;
  final String hashtags;
  final String imageAsset;

  const PostCard({
    super.key,
    required this.organization,
    required this.timeAgo,
    required this.title,
    required this.content,
    required this.hashtags,
    required this.imageAsset,
    required this.icon,
    required this.context,
  });

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
                    Image.asset(icon),
                    SizedBox(
                      width: 5.w,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=> CompanyProfileScreen());

                      },
                        child: Text(organization,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Cabinet Grotesk"))


                    )




                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.topCenter,
                      child: Text(timeAgo,
                          style: const TextStyle(color: AppColors.grayText)))),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: AppColors.grayText,
              fontFamily: "Inter",
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(content),
          const SizedBox(height: 4),
          Text(hashtags, style: const TextStyle(color: Colors.blue)),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
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
              const CustomText(
                text: "\u2764\uFE0F 13 likes",
                fontSize: 14,
                color: AppColors.grayText,
              ),
              Row(
                children: [
                  Image.asset(
                    IconPath.comments,
                    height: 16,
                    width: 16,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  const CustomText(
                    text: AppText.comments,
                    fontSize: 14,
                    color: AppColors.grayText,
                  ),
                ],
              ),
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

