import 'package:flutter/cupertino.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';

Widget getAboutTabBarWidget({String? name, String? details}) {
  return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: name ?? "",
            fontSize: 16,
            color: AppColors.secondaryTextColor,
          ),
          CustomText(
            text: details ?? "",
            fontSize: 16,
            color: AppColors.secondaryTextColor,
          )
        ],
      ));
}
