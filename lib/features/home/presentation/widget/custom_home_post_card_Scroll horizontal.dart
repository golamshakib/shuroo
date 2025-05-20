

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/routes/app_routes.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../controller/home_controller.dart';

class PostCardScrollhorizonta extends StatelessWidget {
  final String organization;
  final String timeAgo;
  final String title;
  final String content;
  final String icon;
  final String hashtags;
  final String imageAsset;

   PostCardScrollhorizonta({
    super.key,
    required this.organization,
    required this.timeAgo,
    required this.title,
    required this.content,
    required this.hashtags,
    required this.imageAsset,
    required this.icon,
  });

  HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
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
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
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
                        Get.toNamed(AppRoute.otherUserProfileScreen);

                      },
                      child: Text(organization,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Cabinet Grotesk")),
                    ),
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
          Container(
            height: 163.h,

            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _controller.item.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 123.w,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      _controller.item[index],

                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
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
