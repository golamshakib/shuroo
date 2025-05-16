import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shuroo/app.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/app_texts.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';

import '../../../features/authentication/controllers/create_account_default_controller.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final String?  icon;
  final bool? isPassword;
  final TextEditingController? controller;

   CustomTextFormField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.icon,
    this.controller, this.isPassword,
  }) : super(key: key);
  final DefaultController passwordController = Get.put(DefaultController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>  passwordController.isCheck.value!= false ?
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
              fontSize: 12.sp,
            )),
        const SizedBox(height: 6),
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white, // Light grey background
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 20,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12), // Ensures children match corners
            child: TextFormField(
              obscureText: passwordController.obscureText.value,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                suffixIcon: icon != null&&icon!=IconPath.eye
                    ? Image.asset(icon!, height: 24.h, width: 24.w)
                    : icon==null
                    ? null
                    :IconButton(
                  icon: Icon(
                    passwordController.obscureText.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: passwordController.togglePasswordVisibility,
                ) ,
                hintStyle: TextStyle(color: Colors.grey,fontSize: 14.sp),
                filled: true,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                fillColor: Colors.white, // Light grey background

              ),
            ),
          ),
        ),

      ],
    ):Row()

    );
  }
}
