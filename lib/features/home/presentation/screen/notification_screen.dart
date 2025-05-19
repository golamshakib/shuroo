import 'package:flutter/material.dart';
import 'package:shuroo/core/common/widgets/custom_back_button.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        title: CustomText(text: 'Notification', fontSize: 20.sp,fontWeight: FontWeight.w600,color: AppColors.textPrimary,),
      ),
      body: SafeArea(child: Padding(padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              
            ],
          ),
        ),
      )),
    );
  }
}
