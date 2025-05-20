import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_texts.dart';
import 'package:shuroo/routes/app_routes.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';








void showRepostPopup(BuildContext context) {
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
              icon:  IconPath.frame,
              title: AppText.repostwithyour,
              subtitle: AppText.create_a_new_post_with,
              onTap: () {
                Get.toNamed(AppRoute.repostWithThroughtScreen);
                // Add your logic here
              },
            ),
            SizedBox(height: 16),
            _popupOption(
              icon:IconPath.reposts,
              title: AppText.repost,
              subtitle:
              AppText.instantly_bring_rockfile,
              onTap: () {
                Get.toNamed(AppRoute.myAllPostScreen);

                // Add your logic here
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
  required String subtitle,
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
              CustomText(text:title ,fontSize: 14,color: AppColors.secondaryTextColor,),



              SizedBox(height: 4),
              Text(subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600])),
            ],
          ),
        ),
      ],
    ),
  );
}
