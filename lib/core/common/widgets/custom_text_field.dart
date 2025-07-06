import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    this.focusNode,
    this.onTap,
    this.inputFormat,
    this.onChange,
    this.onTapOutside,
    this.fontSize = 14,
    this.textAlign = TextAlign.start,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.prefixIcon,
    this.fillColor,
    this.maxLine = 1,
    this.minLine,
    this.radius = 12,
    this.padding,
    this.showBorder = true,
  });

  final TextEditingController controller;
  final Function(String)? onChange;
  final Function(PointerDownEvent)? onTapOutside;
  final FocusNode? focusNode;
  final String hintText;
  final List<TextInputFormatter>? inputFormat;
  final Function()? onTap;
  final bool obscureText;
  final dynamic fillColor;
  final TextAlign textAlign;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool readOnly;
  final double fontSize;
  final int maxLine;
  final int? minLine;
  final double radius;
  final EdgeInsets? padding;
  final bool? showBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      onTap: onTap,
      inputFormatters: inputFormat,
      style: GoogleFonts.inter(
        color: AppColors.textGray,
        fontWeight: FontWeight.w400,
        fontSize: fontSize.sp,
        height: 30 / 14,
      ),
      focusNode: focusNode,
      maxLines: maxLine,
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
        enabledBorder: showBorder == true
            ? OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFE6E6E7), width: 1),
                borderRadius: BorderRadius.circular(radius),
              )
            : InputBorder.none,
        focusedBorder: showBorder == true
            ? OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFE6E6E7), width: 1),
                borderRadius: BorderRadius.circular(radius),
              )
            : InputBorder.none,
        contentPadding: padding ??
            EdgeInsets.only(
              left: 12.w,
              right: 10.w,
              top: 12.h,
              bottom: 12.h,
            ),
      ),
      validator: validator,
      onTapOutside: onTapOutside ?? (event) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
