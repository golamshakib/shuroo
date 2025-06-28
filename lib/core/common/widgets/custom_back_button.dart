import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key,this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFF5C42FF),
              Color(0xff8673FD),
            ],
          ).createShader(bounds);
        },
        child: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            size: size,
            color: AppColors.textPrimary, // Needed for the gradient to apply properly
          ),
        ),
      ),
    );
  }
}
