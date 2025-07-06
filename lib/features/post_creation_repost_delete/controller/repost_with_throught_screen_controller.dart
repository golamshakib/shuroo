import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/features/post_creation_repost_delete/controller/my_all_post_screen_controller.dart';

class RepostWithThroughtScreenController extends GetxController {
  final TextEditingController textController = TextEditingController();

  var isLoading = true.obs;

  // Expose controllerOne here as a public variable or getter
  final MyAllPostScreenController controllerOne = Get.find<MyAllPostScreenController>();

  void fetchPost(String postId) async {
    await controllerOne.getSinglePost(postId);
    isLoading.value = false;
  }

  Future<void> postRepost(String postId) async {
    try {
      final response = await NetworkCaller().postRequest(
        "${AppUrls.repostPost}/$postId",
        body: {'content': textController.text.toString().trim()},
        token: "Bearer ${AuthService.token}",
      );

      if (response.isSuccess) {
        log("Post Updated ========================================+++++++++");
        textController.clear();
        return;
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      AppSnackBar.showError("Something went wrong!!");
    }
  }
}
