import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';

class WithSocialLoginButton extends StatelessWidget {
  final String text;
  final String img;
  final double left;
  final double right;
  final VoidCallback onTap;

  const WithSocialLoginButton(
      {super.key,
      required this.text,
      required this.img,
      required this.onTap,
      required this.left,
      required this.right});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 25.h, 0, 0),
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
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
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 6.h),
            child: Row(
              children: [
                Image.asset(
                  img,
                  height: 25.h,
                  width: 24.w,
                ),
                Container(
                  margin: EdgeInsets.only(left: left,right: right),
                  child: Text(
                    text ?? 'Sign Up with Phone or Email',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),

            // child: Stack(
            //   alignment: Alignment.center,
            //   children: [
            //     Align(
            //       alignment: Alignment.centerLeft,
            //       child: Padding(
            //         padding: const EdgeInsets.only(left: 20),
            //         child: Image.asset(img,height: 25,width: 24,),
            //       ),
            //     ),
            //     Center(
            //       child: Text(
            //         text ?? 'Sign Up with Phone or Email',
            //         style: const TextStyle(color: Colors.black),
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
