import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_back_button.dart';
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
    return Obx(() {
      final data = controller.getAppliedJob.value.data;
      if(data == null){
        return Center(child: CircularProgressIndicator(color: AppColors.primary));
      }
      if(data.isEmpty) {
        return Center(child: CustomText(text: "No jobs available"));
      }

      return Scaffold(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          appBar: AppBar(
            leading: CustomBackButton(),
            title: CustomText(text: 'Applied Jobs',
              fontSize: 20.sp,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,),
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
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final item = controller.getAppliedJob.value.data![index];
                        return AppliedJobCard(
                          imagePath: item.job?.company?.logoImage ?? '',
                          title: item.job?.name ?? '',
                          name: item.job?.company?.name ?? '',
                          date: item.updatedAt.toString(),
                          salary: "Salary: \$${item.job!.salary.toString()}",
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
    });
  }
}
