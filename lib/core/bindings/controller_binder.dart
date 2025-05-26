

import 'package:get/get.dart';
import 'package:shuroo/features/home/controller/home_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
          () => HomeController(),
      fenix: true,
    );

  }
}