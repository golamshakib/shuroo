import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';

import '../../utils/constants/app_colors.dart';

Future<void> showProgressIndicator() async {

  if (!(Get.isDialogOpen ?? false)) {
    Get.dialog(
      Center(
        child: SpinKitFadingCircle(
          color: AppColors.custom_blue,
          size: 50.h,
        ),
      ),
      barrierDismissible: false,
      useSafeArea: false,
    );
  }
  await Future.delayed(Duration(milliseconds: 1500)); //
}

Future<void> hideProgressIndicator() async {
  await Future.delayed(Duration(milliseconds: 100));
  if (Get.isDialogOpen ?? false) {
    try {
      Get.back();
    } catch (e) {
      // Already closed or error while closing
    }
  }
}

