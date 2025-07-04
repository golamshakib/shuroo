import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';
import 'package:get/get.dart';
import '../../../../core/common/widgets/custom_back_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/interview_controller.dart';
import '../widget/applied_job_card_widget.dart';

class InterviewScreen extends GetView<InterviewController> {
  const InterviewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: CustomBackButton(),
        title: CustomText(text: 'InterViews', fontSize: 20.sp,color: AppColors.textPrimary,fontWeight: FontWeight.w600,),
      ),
      body: SafeArea(child: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() {
                if(controller.isLoading.value){
                  return Center(child: CircularProgressIndicator(color: AppColors.primary));
                }
                final viewJobList = controller.getInterViewJobModel.value.data ?? [];

                if(viewJobList.isEmpty){
                  return Center(child: Text("No Shortlisted found"));
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
