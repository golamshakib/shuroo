import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';

class ConfirmPopup {
  static void show({
    required String title,
    String? message1,
    String? message2,
    String confirmText = "Confirm",
    String cancelText = "Cancel",
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: CustomText(
                  text: title,
                  fontSize: 24,
                  color: AppColors.textPrimary,
                ),
              ),
              if (message1 != null) ...[
                SizedBox(height: 8.h),
                Center(
                  child: CustomText(
                    text: message1,
                    fontSize: 14,
                    color: Color(0xFF555555),
                  ),
                ),
              ],
              if (message2 != null) ...[
                Center(
                  child: CustomText(
                    text: message2,
                    fontSize: 14,
                    color: Color(0xFF555555),
                  ),
                ),
              ],
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.back();
                        if (onCancel != null) onCancel();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Color(0xFFE6E6E7),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: CustomText(
                          text: cancelText,
                          fontSize: 15,
                          color: AppColors.grayText,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.back();
                        if (onConfirm != null) onConfirm();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 35,
                        decoration: BoxDecoration(
                          color: AppColors.custom_blue,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: CustomText(
                          text: confirmText,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
