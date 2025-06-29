import 'package:flutter/material.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import '../../../../core/utils/constants/app_colors.dart';

class CustomRepostScreenCard extends StatelessWidget {
  final String organization;
  final String timeAgo;
  final String title;
  final String content;
  final String icon;
  final BuildContext context;
  final String hashtags;
  final String imageAsset;

  const CustomRepostScreenCard({
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
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
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
        ],
      ),
    );
  }
}

