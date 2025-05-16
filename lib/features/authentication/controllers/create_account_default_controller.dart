import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DefaultController extends GetxController{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  RxBool obscureText = true.obs;
  RxBool isCheck = true.obs;

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }


}