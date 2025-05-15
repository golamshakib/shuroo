import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_texts.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';

import '../../controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Container(
      alignment: Alignment.center,

      decoration: BoxDecoration(

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImagePath.splashScreen_logo,height: 80,width: 80,),
          Text("${AppText.shuroo}",style: TextStyle(
            fontSize: 36
          ),)
        ],
      ),
    )));
  }
}
