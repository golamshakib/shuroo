import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_back_button.dart';
import 'package:shuroo/core/common/widgets/custom_blue_gray_button.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/jobs/controller/applied_controller.dart';
import 'package:shuroo/features/jobs/presentation/widget/applied_job_card_widget.dart';
import 'package:shuroo/routes/app_routes.dart';

class AppliedJobScreen extends StatelessWidget {
   AppliedJobScreen({super.key});

   final AppliedController controller = Get.put(AppliedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: CustomBackButton(),
        title: CustomText(text: 'Applied Jobs', fontSize: 20.sp,color: AppColors.textPrimary,fontWeight: FontWeight.w600,),
      ),
   body: SafeArea(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.appliedList.length,
            itemBuilder: (context, index) {
              final item = controller.appliedList[index];
              return AppliedJobCard(
                imagePath: item.imagePath!,
                title: item.title!,
                name: item.name!,
                date: item.date!,
                salary: item.salary!,
                onTap: () {
                  Get.toNamed(AppRoute.chatScreen);
                },
              );
            },
          ),
        ],
      ),
    ),
  ),
)

    
    
    
    );
  }
}
