import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:shuroo/features/authentication/presentation/screens/login_screen.dart';

import '../../authentication/presentation/screens/started_screen.dart';

class SplashController extends GetxController {
  void navigateToHomeScreen() {
    Future.delayed(
      const Duration(milliseconds: 1500),
          () {
        Get.offAll(
              () => const StartedScreen(),
          transition: Transition.fade,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    navigateToHomeScreen();
  }
}
