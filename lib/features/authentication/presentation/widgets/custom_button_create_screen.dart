import 'package:flutter/material.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';

class CustomButtonCreateScreen extends StatelessWidget {
  final String text;
  final String img;
  final double left;
  final double right;
  final VoidCallback onTap;

  const CustomButtonCreateScreen(
      {super.key,
      required this.text,
      required this.img,
      required this.onTap,
      required this.left,
      required this.right});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white, // background color
              borderRadius: BorderRadius.circular(50), // rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  img,
                  height: 25.h,
                  width: 24.w,
                ),
                // Container(
                //   margin: EdgeInsets.only(left: left,right: right),
                //   child: Text(
                //     text,
                //     style: const TextStyle(color: Colors.black,fontSize:15 ),
                //   ),
                // ),
                CustomText(text: text, fontSize: 15.sp, textAlign: TextAlign.center,),
                Icon(Icons.circle, color: Colors.transparent,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
