import 'package:flutter/cupertino.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';

Widget  getAboutTabBarWidget({String? name, String? details}) {
  return Row(
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
  );
}