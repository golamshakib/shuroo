import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/common/widgets/progress_indicator.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';

class ChangePasswordController extends GetxController {
  @override
  void onClose() {
    currentTEController.dispose();
    newTEController.dispose();
    confirmTEController.dispose();
    super.onClose();
  }

  final currentTEController = TextEditingController();
  final newTEController = TextEditingController();
  final confirmTEController = TextEditingController();

  RxBool currentVisibility = true.obs;
  RxBool newVisibility = true.obs;
  RxBool confirmVisibility = true.obs;

  Future<void> changePassword() async {
  final oldPassword = currentTEController.text.trim();
  final newPassword = newTEController.text.trim();
  final confirmPassword = confirmTEController.text.trim();

  if (oldPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
    AppSnackBar.showError('Please fill in all fields');
    return;
  }

  if (newPassword != confirmPassword) {
    AppSnackBar.showError('New password and confirm password do not match');
    return;
  }

  final requestBody = {
    'oldPassword': oldPassword,
    'newPassword': newPassword,
  };

  try {
    showProgressIndicator();
    final response = await NetworkCaller().putRequest(
      AppUrls.changePassword,
      token: "Bearer ${AuthService.token}",
      body: requestBody,
    );

    if (response.isSuccess && response.statusCode == 200) {
      AppSnackBar.showSuccess('Password updated successfully');
      
    } else if (response.statusCode == 400) {
      AppSnackBar.showError('Old password is incorrect');
    } else {
      AppSnackBar.showError('Something went wrong');
      print('Unexpected response: $e');
    }
  } catch (e) {
    AppSnackBar.showError('Something went wrong $e');
    print('Exception occurred: $e');
  } finally {
    hideProgressIndicator();
  }
}

}
