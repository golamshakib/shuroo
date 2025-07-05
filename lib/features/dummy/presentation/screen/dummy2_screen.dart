import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/dummy/controller/dummy2_controller.dart';

class Dummy2Screen extends GetView<Dummy2Controller> {
  const Dummy2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() =>
      controller.isLoading.value ?
      Center(
          child: SpinKitFadingCircle(
            color: AppColors.primary,
            size: 50.h,
          )
      ) :
      Center(
        child: CustomText(text: controller.othersUserProfile.value.data!.name!),
      )
        
      )
    );
  }
}
