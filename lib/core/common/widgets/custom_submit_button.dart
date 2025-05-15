import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';

import '../../utils/constants/app_colors.dart';

class CustomSubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Widget? prefixIcon;
  final Widget? nextIcon;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final double? height;

  const CustomSubmitButton({
    super.key,
    required this.text,
    required this.onTap,
    this.height,
    this.prefixIcon,
    this.fontSize,
    this.nextIcon,
    this.child,
    this.padding,
    this.borderRadius,
    this.color, // Optional color parameter
    this.textColor, // Optional text color parameter
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        color: color ?? Color(0xFF7B61FF), // Use the provided color or the default color
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        child: InkWell(
            splashColor: Colors.white.withOpacity(0.5),
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            onTap: onTap,
            child: Container(
              height: height?? 50,
              width: double.infinity,
              padding: padding ?? EdgeInsets.symmetric(vertical: 5.w),
              decoration: BoxDecoration(
                borderRadius: borderRadius ?? BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefixIcon != null) ...[
                    const SizedBox(),
                    SizedBox(
                      height: 22.w,
                      width: 22.w,
                      child: prefixIcon!,
                    ),
                  ],
                  SizedBox(width: 8.w),
                  if (child == null) ...[
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize:fontSize?? 16.w,
                        fontWeight: FontWeight.w600,
                        color: textColor ?? AppColors.white,
                      ),
                    ),
                  ],
                  if (child != null) ...[
                    child!,
                  ],
                  if (nextIcon != null) ...[
                    Padding(
                      padding: EdgeInsets.only(left: 12.w),
                      child: SizedBox(
                        width: 25.w,
                        child: nextIcon!,
                      ),
                    ),
                  ],
                ],
              ),
            ),
        ),
        );
    }
}