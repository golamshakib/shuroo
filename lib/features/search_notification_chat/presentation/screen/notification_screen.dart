import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/search_notification_chat/controller/notification_controller.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../core/common/widgets/custom_back_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';


class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final NotificationController controller = NotificationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: CustomBackButton(),
        title: CustomText(text: 'Notification',
          fontSize: 20.sp,
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,),
      ),
      body: SafeArea(child: Padding(padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() =>
              controller.isLoading.value
                      ? Center(
                           child: CircularProgressIndicator(color: AppColors.primary),
                      ) : ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.getAllNotification.value.data != null
                             ? controller.getAllNotification.value.data!.length : 0,
                  itemBuilder: (context, index) {
                    final notificationList = controller.getAllNotification.value.data![index];
                    final updatedTime = DateTime.parse(notificationList.updatedAt.toString());

                    return Container(
                        margin: EdgeInsets.symmetric(vertical: 6),
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
                                CustomText(
                                  text: notificationList.title ?? '',
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textPrimary,
                                ),
                                Spacer(),
                                CustomText(
                                  text:  timeago.format(updatedTime),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffC9C9C9),
                                ),
                              ],
                            ),
                            CustomText(
                              text: notificationList.body ?? '',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textGray,
                            ),

                          ],
                        )
                    );
                  },
                )
              ),
            ],
          ),
        ),
      )),
    );
  }
}
