import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import '../../utils/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.onChange,
    this.fontSize = 14,
    this.textAlign = TextAlign.start,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.prefixIcon,
    this.fillColor,
    this.maxLine,
    this.minLine,
    this.radius = 12,
    this.padding,
  });

  final TextEditingController controller;
  final Function(String)? onChange;
  final String hintText;
  final bool obscureText;
  final dynamic fillColor;
  final TextAlign textAlign;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool readOnly;
  final double fontSize;
  final int? maxLine;
  final int? minLine;
  final double radius;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: TextFormField(
        onChanged: onChange,
        style: GoogleFonts.inter(
          color: AppColors.textGray,
          fontWeight: FontWeight.w400,
          fontSize: fontSize.sp,
          height: 30 / 14,
        ),
        maxLines: maxLine??1,
        minLines: minLine,
        readOnly: readOnly,
        keyboardType: keyboardType,
        obscureText: obscureText,
        controller: controller,
        textAlign: textAlign,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintStyle: GoogleFonts.dmSans(
            color: AppColors.textGray,
            fontWeight: FontWeight.w400,
            fontSize: fontSize.sp,
            height: 20 / 14,
          ),
          fillColor: fillColor ?? Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFE6E6E7), width: 1),
              borderRadius: BorderRadius.circular(radius)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFE6E6E7), width: 1),
              borderRadius: BorderRadius.circular(radius)),
          contentPadding: padding ??
              EdgeInsets.only(
                  left: 12.w, right: 10.w, top: 12.h, bottom: 12.h),
        ),
        validator: validator,
        onTapOutside: (c) {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}

