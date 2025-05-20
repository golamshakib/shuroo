import 'package:flutter/material.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_texts.dart';
import 'getAboutTabBarWidget.dart';

Widget getAboutItem() {
  return Container(
    padding: EdgeInsets.only(left: 16, top: 16, right: 16),
    margin: EdgeInsets.only(top: 16, left: 16),
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
    child: Column(
      children: [
        CustomText(
          text: AppText.wildWorldConservation,
          fontSize: 16,
          color: AppColors.secondaryTextColor,
        ),
        SizedBox(
          height: 20,
        ),
        getAboutTabBarWidget(name: "Industry", details: "Software"),
        getAboutTabBarWidget(
            name: "Company Size", details: "51-200 employees"),
        getAboutTabBarWidget(name: "Founded", details: "2020"),
      ],
    ),
  );
}