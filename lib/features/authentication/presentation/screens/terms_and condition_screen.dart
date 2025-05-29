import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/app_colors.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
        child: SafeArea(
        child: Container(
        margin: EdgeInsets.only(left: 16, top: 20, right: 21),
    child: SingleChildScrollView(
      child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(Icons.arrow_back, size: 24)),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 64.5.w),
                          child: CustomText(text: AppText.termsConditions,fontSize:20.sp,color: AppColors.textPrimary ,),
                        ),

                      ],
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 4.w,top: 12),
                      child: CustomText(text: AppText.welcomeToShuroo,fontSize:16.sp,color: AppColors.darkBackground ,),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• ', style: TextStyle(fontSize: 16)),
                          Expanded(child: Text(AppText.acceptanceofTerms, style: const TextStyle(fontSize: 16))),
                        ],
                      ),
                    ),

            Container(
              margin: EdgeInsets.only(left: 12),
              child:
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('•  ', style: TextStyle(fontSize: 16)),
                  Expanded(child: Text(AppText.byaccessingor, style: const TextStyle(fontSize: 16))),
                ],
              ),

            ),



                    Container(
                      margin: EdgeInsets.only(top: 12,bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• ', style: TextStyle(fontSize: 16)),
                          Expanded(child: Text(AppText.userResponsibilities, style: const TextStyle(fontSize: 16))),
                        ],
                      ),
                    ),



                    Container(
                      child: BulletPoint(
                          AppText.youconfirm),
                    ),

                    BulletPoint(AppText.provideAccurate),

                    BulletPoint(
                        AppText.useThePlatform),

                    BulletPoint(
                        AppText.notImpersonate),

                    Container(
                      margin: EdgeInsets.only(top: 12,bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• ', style: TextStyle(fontSize: 16)),
                          Expanded(child: Text(AppText.jobApplication, style: const TextStyle(fontSize: 16))),
                        ],
                      ),
                    ),



                    // SectionTitle('3. Job Applications & Referrals'),
                    BulletPoint(
                        AppText.shurooProvidesJob),
                    BulletPoint(
                        AppText.referralRewards),


                    Container(
                      margin: EdgeInsets.only(top: 12,bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• ', style: TextStyle(fontSize: 16)),
                          Expanded(child: Text(AppText.accountSecurity, style: const TextStyle(fontSize: 16))),
                        ],
                      ),
                    ),

                    // SectionTitle('4. Account Security'),
                    BulletPoint(
                        AppText.youAreResponsible),
                    BulletPoint(
                        AppText.notifyUsImmediately),
                    // SizedBox(height: 16),
                    // SectionTitle('5. Content Ownership'),
                    BulletPoint(
                        AppText.usersRetain),
                    BulletPoint(
                        AppText.shurooMayDisplay),

                    Container(
                      margin: EdgeInsets.only(top: 12,bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• ', style: TextStyle(fontSize: 16)),
                          Expanded(child: Text(AppText.terminationy, style: const TextStyle(fontSize: 16))),
                        ],
                      ),
                    ),


                    // SectionTitle('6. Termination'),
                    BulletPoint(
                        AppText.weReserveThe),

                    Container(
                      margin: EdgeInsets.only(top: 12,bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• ', style: TextStyle(fontSize: 16)),
                          Expanded(child: Text(AppText.modifications, style: const TextStyle(fontSize: 16))),
                        ],
                      ),
                    ),

                    // SectionTitle('7. Modifications'),
                    BulletPoint(
                        AppText.weMayUpdate),

                    Container(
                      margin: EdgeInsets.only(top: 12,bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• ', style: TextStyle(fontSize: 16)),
                          Expanded(child: Text(AppText.contact, style: const TextStyle(fontSize: 16))),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),
                    // SectionTitle('8. Contact'),
// You can add contact information here
                  ],
                ),


    )),
        ),
      ),
    );
  }
}




class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 35),
      child:
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('•  ', style: TextStyle(fontSize: 16)),
            Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
          ],
        ),

    );
  }
}
