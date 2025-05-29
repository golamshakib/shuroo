import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import '../../../features/authentication/controllers/create_account_default_controller.dart';

class CustomTextFormFieldPass extends StatefulWidget {
  final String label;
  final String hintText;
  final String? fontFamily;
  final String? icon;
  final int? hintSize;
  final Color? hintColor;
  final Color? titleColor;
  final ValueChanged<String>? onChanged;

  final bool isPassword = true;
  final TextEditingController? controller;

  const CustomTextFormFieldPass({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
    this.controller,
    this.hintColor,
    this.hintSize,
    this.fontFamily,
    this.onChanged, this.titleColor,
  });

  @override
  State<CustomTextFormFieldPass> createState() => _CustomTextFormFieldPassState();
}

class _CustomTextFormFieldPassState extends State<CustomTextFormFieldPass> {
  bool passwordShowAndHide = true;

  final DefaultController _controller = Get.put(DefaultController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => _controller.isCheck.value != false
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 4),
                child: Text(widget.label,
                    style: TextStyle(
                      color: Colors.black,
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
                    onChanged: widget.onChanged ?? (sd) {},
                    obscureText: passwordShowAndHide,
                    controller: widget.controller,
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      suffixIcon: IconButton(
                        icon: Icon(
                          passwordShowAndHide
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          if (passwordShowAndHide) {
                            passwordShowAndHide = false;
                          } else {
                            passwordShowAndHide = true;
                          }
                          setState(() {});
                        },
                      ),
                      hintStyle: TextStyle(
                          fontFamily: widget.fontFamily ?? null,
                          color: widget.hintColor ?? Colors.grey,
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
