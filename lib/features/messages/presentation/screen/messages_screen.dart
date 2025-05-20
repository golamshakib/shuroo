import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../controller/messages_controller.dart';

class MessagesScreen extends StatelessWidget {
   MessagesScreen({super.key});

   final MessagesController controller = Get.put(MessagesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        title: CustomText(
            text: 'Message', fontSize: 20.sp,fontWeight: FontWeight.w600,color: AppColors.textPrimary),
      ),
      body: SafeArea(child: Padding(padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.messageList.length,
                itemBuilder: (context, index) {
                  final messageList = controller.messageList[index];
                  return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Color(0xffF5F5F5), width: 0.2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(messageList.uiImagePath!),
                              ),
                              SizedBox(width: 12.w),
                              CustomText(
                                text: messageList.title!,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textPrimary,
                              ),
                              Spacer(),
                              CustomText(
                                text: messageList.time!,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffC9C9C9),),
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 50),
                            child: CustomText(
                              text: messageList.name!,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Padding(
                            padding:  EdgeInsets.only(left: 50),
                            child: CustomText(
                              text: messageList.subTitle!,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textGray,
                            ),
                          ),
                        ],
                      )
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
