import 'package:flutter/material.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/image_path.dart';

class CustomRepostScreenCard extends StatelessWidget {
  final String organization;
  final String? timeAgo;
  final String? title;
  final String content;
  final String icon;
  final BuildContext context;
  final String? hashtags;
  final String? imageAsset;

  const CustomRepostScreenCard({
    super.key,
    required this.organization,
    this.timeAgo,
    this.title,
    required this.content,
    this.hashtags,
    this.imageAsset,
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
                    icon == "null" ?
                    ClipOval(
                      child: Image.asset(
                        ImagePath.dummyProfilePicture,
                        width: 24.w,
                        height: 24.h,
                        fit: BoxFit.fill,
                      ),
                    ) :
                    ClipOval(
                      child: Image.network(
                        icon,
                        width: 24.w,
                        height: 24.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomText(text: title.toString(), fontSize: 14.sp,),
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
          const SizedBox(height: 8),
          Text(content),
          SizedBox(height: 12.h),
          if (imageAsset != "")
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageAsset!,
                fit: BoxFit.cover,
                height: 151.h,
                width: 341.w,
              ),
            ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

