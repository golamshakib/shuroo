import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:password_strength_indicator_plus/password_strength_indicator_plus.dart';
import 'package:shuroo/core/common/widgets/app_color.dart';
import 'package:shuroo/core/common/widgets/custom_submit_button.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_textform_field.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../controllers/create_account_default_controller.dart';
import '../../controllers/create_account_filled_screen_controller.dart';

class CreateAccountFilledScreen extends StatelessWidget {
  CreateAccountFilledScreen({super.key});

  final FilledScreenController _controller = Get.put(FilledScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
              child: Container(
                  margin: EdgeInsets.only(left: 16, top: 20, right: 16),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(Icons.arrow_back, size: 24)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            Image.asset(
                                ImagePath.logo, height: 62.w, width: 62.w),
                            SizedBox(height: 12),
                            CustomText(
                                text: AppText.create_account, fontSize: 24),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 32),
                        child: CustomTextFormField(
                          controller: _controller.nameController,
                          label: AppText.rochelle_backman,
                          hintText: AppText.enterYourName,
                          fontFamily: 'Inter',
                          hintColor: AppColors.textPrimary,
                          icon: IconPath.prame,
                          hintSize: 16,
                        ),
                      ),
                      // SizedBox(height: 24,),

                      Container(
                        margin: EdgeInsets.only(top: 24.h),
                        child: CustomTextFormField(
                          controller: _controller.emailController,
                          label: AppText.hint_rochellebackman,
                          hintText: AppText.hint_rochellebackman,
                          fontFamily: 'Inter',
                          hintColor: AppColors.textPrimary,
                          hintSize: 16,
                          icon: IconPath.email,
                        ),
                      ),
                      // SizedBox(height: 24,),

                      Container(
                        margin: EdgeInsets.only(top: 24.h),
                        child: CustomTextFormField(
                          controller: _controller.passController,
                          label: AppText.createPassword,
                          hintText: AppText.hintPassword,
                          icon: IconPath.eye,
                          fontFamily: 'Inter',
                          isPassword: false,
                          hintColor: AppColors.textPrimary,
                          hintSize: 16,
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 24),
                        child: CustomText(
                          text: AppText.password_must,
                          color: AppColors.textSecondary,
                        ),
                      ),

                      Obx(() =>
                      _controller.isCheckd.value == true
                          ? PasswordStrengthIndicatorPlus(
                        textController: _controller.emailController,
                        maxLength: 12,
                        minLength: _controller.checkValue.value.contains("less")
                            ? (_controller.passController.text.length+8 )
                            : _controller.checkValue.value.contains("yellow")?

                             0

                            :-0,



                        successIcon: Icons.check_circle,
                        unSuccessIcon: Icons.cancel,
                        successWidget:_controller.checkValue.value.contains("green")?
                        const Icon(Icons.check_circle,  color: Colors.green):
                        _controller.checkValue.value.contains("yellow")?
                        const Icon(Icons.check_circle,  color: Colors.yellow):
                        const Icon(Icons.check_circle,  color: Colors.yellow)
                        ,
                        unSuccessWidget:
                        const Icon(Icons.cancel, color: Colors.red),
                        textSize: 16,
                        hideRules: true,
                      )



                          : PasswordStrengthIndicatorPlus(
                        textController: _controller.passController,
                        maxLength: 12,
                        minLength: 6,
                        successIcon: Icons.check_circle,
                        unSuccessIcon: Icons.cancel,
                        successWidget: const Icon(Icons.check_circle,
                            color: Colors.green),
                        unSuccessWidget:
                        const Icon(Icons.cancel, color: Colors.red),
                        textSize: 16,
                        hideRules: true,
                      )),

                      Container(
                        margin: EdgeInsets.only(top: 69, bottom: 20),
                        child: Text.rich(
                          TextSpan(
                            text: AppText.byproceeding,
                            style: const TextStyle(
                                color: AppColors.textSecondary, fontSize: 14),
                            children: [
                              TextSpan(
                                text: AppText.termsConditions,
                                style: TextStyle(
                                    color: AppColors.textPrimary, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),

                      CustomSubmitButton(
                        text: AppText.create_account,
                        onTap: () {},
                        color: AppColors.custom_blue,
                        borderRadius: BorderRadius.circular(50),
                        fontSize: 15.sp,
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 20.w, bottom: 28.h),
                        child: Text.rich(
                          TextSpan(
                            text: AppText.already_have_an_account,
                            style: const TextStyle(
                                color: AppColors.textSecondary, fontSize: 16),
                            children: [
                              TextSpan(
                                text: AppText.sign_in,
                                style: TextStyle(
                                    color: AppColors.custom_blue, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ))),
        ));
  }
}
// class PasswordPage extends StatelessWidget {
//    PasswordPage({super.key});
//
//   final TextEditingController _passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Password Strength Indicator')),
//       body: Padding(
//         padding: const EdgeInsets.all(0.0),
//         child: Column(
//           children: [
//           TextField(
//           controller: _passwordController,
//           obscureText: true,
//           decoration: const InputDecoration(
//             labelText: 'Enter Password',
//           ),
//         ),
//         const SizedBox(height: 20),
//         PasswordStrengthIndicatorPlus(
//           textController: _passwordController,
//           maxLength: 12,
//           minLength: 8,
//           successIcon: Icons.check_circle,
//           unSuccessIcon: Icons.cancel,
//           successWidget: const Icon(Icons.check_circle, color: Colors.green),
//           unSuccessWidget: const Icon(Icons.cancel, color: Colors.red),
//           textSize: 16,
//           hideRules: true,
//           // Customizing the indicator colors
//           strengthColors: [
//             Colors.red,     // Weak
//             Colors.orange,  // Average
//             Colors.yellow,  // Good
//             Colors.green,   // Strong
//           ],
//         ),
//         ),
//       ),
//     );
//   }
// }

class PasswordPage extends StatelessWidget {

  PasswordPage({super.key});

  final TextEditingController _passwordController = TextEditingController();
  final FilledScreenController _controller = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Password Strength Indicator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(()=>
        Column(
            children: [


              PasswordStrengthIndicatorPlus(
                textController: _controller.passController,
                maxLength: 12,
                minLength: 6,
                successIcon: Icons.check_circle,
                unSuccessIcon: Icons.cancel,
                successWidget: _controller.checkValue.value.contains("green")?
                const Icon(Icons.check_circle,  color: Colors.green):
                _controller.checkValue.value.contains("yellow")?
                const Icon(Icons.check_circle,  color: Colors.yellow):
                const Icon(Icons.check_circle,  color: Colors.yellow)
                ,
                unSuccessWidget: const Icon(Icons.cancel, color:   Colors.red),
                textSize: 16,
                hideRules: true,
                // Customizing the indicator colors
              ),
            ],
          ),
        ),
      ),
    );
  }
}
