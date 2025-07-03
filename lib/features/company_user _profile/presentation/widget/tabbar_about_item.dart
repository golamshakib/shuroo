import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/features/profile/controller/personal_creation_controller.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_texts.dart';
import 'getAboutTabBarWidget.dart';

Widget getAboutItem() {
  final controllerOne = Get.find<PersonalCreationController>();
  final user = controllerOne.userProfile.value.data;

  return Container(
    padding: EdgeInsets.all(16),
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
          text: user?.about ?? 'No About Found',
          fontSize: 16,
          color: AppColors.secondaryTextColor,
        ),
        SizedBox(
          height: 20,
        ),
        getAboutTabBarWidget(
            name: "Industry", details: user?.companyType ?? 'Not Found'),
            
        getAboutTabBarWidget(
            name: "Company Size",
            details: "${user?.totalEmployees ?? '00'} employees"),
        getAboutTabBarWidget(
            name: "Founded",
            details: user?.establishmentYear ?? 'Founded date not found'),
      ],
    ),
  );
}
