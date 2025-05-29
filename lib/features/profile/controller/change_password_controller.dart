
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{

  final currentTEController = TextEditingController();
  final newTEController = TextEditingController();
  final confirmTEController = TextEditingController();

  RxBool currentVisibility = true.obs;
  RxBool newVisibility = true.obs;
  RxBool confirmVisibility = true.obs;
}