import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import '../../nav_bar/presentation/screens/nav_bar.dart';
import '../../onboarding/screens/started_screen.dart';

class SplashController extends GetxController {
  void navigateToHomeScreen() {
    Future.delayed(
      const Duration(milliseconds: 1500),
          () {
        Get.offAll(
              () => AuthService.hasToken() ?  NavBar() : const StartedScreen(),
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
