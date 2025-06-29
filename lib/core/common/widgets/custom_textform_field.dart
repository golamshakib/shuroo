import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import '../../../features/authentication/controllers/create_account_default_controller.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String hintText;
  final String? fontFamily;
  final String? icon;
  final int? hintSize;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Color? hintColor;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final bool? isPassword;
  final TextEditingController? controller;

  CustomTextFormField({
    super.key,
    this.label,
    required this.hintText,
    this.icon,
    this.keyboardType,
    this.inputFormatters,
    this.controller,
    this.isPassword,
    this.hintColor,
    this.hintSize,
    this.fontFamily,
    this.onChanged,
    this.prefixIcon,
  });

  final _controller = Get.put(DefaultController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => _controller.isCheck.value != false
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 4),
                child: Text(label!,
                    style: TextStyle(
                      fontSize: 12.sp,
                    )),
              ),
              const SizedBox(height: 6),
              Container(
                height: 56.h,
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
                  borderRadius: BorderRadius.circular(12),
                  // Ensures children match corners
                  child: TextFormField(
                    onChanged: onChanged ?? (sd) {},
                    controller: controller,
                    inputFormatters: inputFormatters,
                    keyboardType: keyboardType,
                    decoration: InputDecoration(
                      hintText: hintText,
                      prefixIcon: prefixIcon,
                      suffixIcon:icon!=null? Image.asset(icon!, height: 24.h, width: 24.w):null,
                      hintStyle: TextStyle(
                          fontFamily: fontFamily ?? null,
                          color: hintColor ?? Colors.grey,
                          fontSize: 14.sp),
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
          )
        : Row());
  }
}
