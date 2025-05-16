
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';

import '../../utils/constants/app_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final double? decorationthickness;
  final TextOverflow? textOverflow;
  final TextDecoration? decoration;
  final Color? decorationColor;


  const CustomText(
      {super.key,
        required this.text,
        this.textAlign,
        this.decorationthickness,
        this.maxLines,
        this.textOverflow,
        this.fontSize,
        this.color,
        this.fontWeight,
        this.decoration,
        this.decorationColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.cabin(
          decoration: decoration,
          decorationThickness: decorationthickness,
          decorationColor: decorationColor ?? const Color(0xff2972FF),
          fontSize: fontSize ?? 14.sp,
          color: color ?? AppColors.textPrimary,
          fontWeight: fontWeight ?? FontWeight.w600),
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }}