
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';


class ViewImageScreen extends StatelessWidget {
  const ViewImageScreen({super.key, this.imageUrl});
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return Scaffold(

        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                      onTap: (){
                        Get.back();


                      },
                      child: const Icon(Icons.arrow_back_outlined)),
                ),
                SizedBox(height: 80.h,),
                Image.asset("assets/images/no_image.jpg"),
              ],
            ),
          ),
        ),
      );
    } else if (imageUrl!.isEmpty) {
      return Scaffold(

        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                      onTap: (){
                        Get.back();


                      },
                      child: const Icon(Icons.arrow_back_outlined)),
                ),
                SizedBox(height: 80.h,),
                Image.asset("assets/images/no_image.jpg"),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(

        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                      onTap: (){
                        Get.back();


                      },
                      child: const Icon(Icons.arrow_back_outlined)),
                ),
                SizedBox(height: 80.h,),
                Image.network(imageUrl ?? ""),
              ],
            ),
          ),
        ),
      );
    }
  }
}
