import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/features/post_creation_repost_delete/controller/my_all_post_screen_controller.dart';
import 'package:shuroo/features/profile/controller/personal_creation_controller.dart';
import 'package:shuroo/features/profile/data/user_data_model.dart';

class RepostWithThroughtScreenController extends GetxController {
  final TextEditingController textController = TextEditingController();

  var isLoading = false.obs;

  // Expose controllerOne here as a public variable or getter
  final MyAllPostScreenController controllerOne = Get.find<MyAllPostScreenController>();

  var userProfileInfo = GetUser().obs;

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    if(Get.arguments != null){
      log("===========================Here in init=================================");
      isLoading.value = true;
      log("===========================Here making true=================================");
      final object = Get.find<PersonalCreationController>();
   // await   object.getProfile().then((onValue){
   //   if(object.profile.data != null){
   //     log("Data is not nul: ${object.profile.data!.name}");
   //     userProfileInfo.value = object.profile;
   //   }
   //
   // });

      ever(object.isLoading, (callback){
        if(object.isLoading.value){
          log("Loading........");
        }else
        {
          userProfileInfo.value = object.profile;
        }

      });

      log("===========================After fetched Profile=================================");
      await postRepost(Get.arguments);
      log("===========================After fetched post=================================");
      isLoading.value = false;
      log("===========================Loader False=================================");
    }
  }

  void fetchPost(String postId) async {
    await controllerOne.getSinglePost(postId);
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
