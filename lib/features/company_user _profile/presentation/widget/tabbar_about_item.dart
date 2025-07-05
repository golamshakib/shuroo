import 'package:get/get.dart';
import 'getAboutTabBarWidget.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import 'package:shuroo/features/company_user%20_profile/controller/other_user_profile_screen_controller.dart';

Widget getAboutItem() {
  final controllerOne = Get.find<OtherUserProfileScreenControllar>();
  final user = controllerOne.othersUserProfile.value.data;

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
          name: "Industry",
          details: user?.companyType ?? 'Not Found',
        ),
        getAboutTabBarWidget(
          name: "Company Size",
          details: "${user?.totalEmployees?.toString() ?? '00'} employees",
        ),
        getAboutTabBarWidget(
          name: "Founded",
          details:
              user?.establishmentYear?.toString() ?? 'Founded date not found',
        ),
      ],
    ),
  );
}
