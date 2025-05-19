
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/icon_path.dart';

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

  final List<String> imageUrls = [
    'https://picsum.photos/200/300?random=1',
    'https://picsum.photos/200/300?random=2',
    'https://picsum.photos/200/300?random=3',
    'https://picsum.photos/200/300?random=4',
    'https://picsum.photos/200/300?random=5',
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
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


            Container(
              height: 200,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageUrls[index],
                        width: 150,
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
      ),
    );
  }
}
