import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shuroo/core/common/widgets/custom_back_button.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/jobs/controller/applied_controller.dart';
import 'package:shuroo/features/jobs/presentation/widget/applied_job_card_widget.dart';
import 'package:shuroo/routes/app_routes.dart';

import '../../../../core/utils/constants/image_path.dart';

class AppliedJobScreen extends GetView<AppliedController> {
 const AppliedJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: AppBar(
          leading: CustomBackButton(),
          title: CustomText(text: 'Applied Jobs',
            fontSize: 20.sp,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,),
        ),
        body: SafeArea(child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  if(controller.isLoading.value){
                    return Center(
                        child: SpinKitFadingCircle(
                          color: AppColors.primary,
                          size: 50.h,
                        )
                    );
                  }
                  final viewJobList = controller.getAppliedJob.value.data ?? [];

                  if(viewJobList.isEmpty){
                    return Center(child: Text("No Application found"));
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: viewJobList.length,
                    itemBuilder: (context, index) {
                      final viewJob = viewJobList[index];
                      return AppliedJobCard(
                        imagePath: viewJob.job?.company?.logoImage?.isNotEmpty == true
                            ? viewJob.job!.company!.logoImage!
                            : ImagePath.dummyProfilePicture,
                        id: viewJob.job!.id!,
                        status: "Applied",
                        title: viewJob.job?.name ?? '',
                        name: viewJob.job?.company?.name ?? '',
                        date: DateFormat('dd MMMM yy').format(DateTime.parse(viewJob.updatedAt.toString())),
                        salary: "Salary: \$${viewJob.job!.salary.toString()}",
                        onTap: () {
                          Get.toNamed(AppRoute.chatScreen);
                        },
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        )),
        );
  }
}
