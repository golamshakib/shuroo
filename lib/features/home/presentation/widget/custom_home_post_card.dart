import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/app_texts.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';

import '../../../../core/utils/constants/app_colors.dart';

class PostCard extends StatelessWidget {
  final String organization;
  final String timeAgo;
  final String title;
  final String content;
  final String icon;
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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10,left: 10,right: 10),
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
                    Text(organization,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Cabinet Grotesk")),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.topCenter,
                      child: Text(timeAgo,
                          style:
                              const TextStyle(color: AppColors.grayText)))),
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
                  Image.asset(IconPath.comments,height: 16,width: 16,),
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

              Row(
                children: [
                  Image.asset(IconPath.reposts,height: 16,width: 16,),
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



              Row(
                children: [
                  Image.asset(IconPath.send,height: 16,width: 16,),
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
