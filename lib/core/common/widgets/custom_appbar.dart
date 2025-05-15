import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import '../../utils/constants/app_colors.dart';
import 'custom_text.dart';

class CustomAppbar extends StatelessWidget {
  final String? title;
  final Widget? icon;
  final double? fontSize;

  const CustomAppbar({super.key, this.title, this.icon, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: icon ?? const Icon(Icons.arrow_back_ios_new),
              ),
              Expanded(
                child: Center(
                  child: CustomText(
                    text: title ?? '',
                    fontSize: fontSize ?? 24.w,

                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
        ),
    );
  }
}