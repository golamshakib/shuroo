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

import '../data/single_post_data_model.dart';

class RepostWithThroughtScreenController extends GetxController {
  final TextEditingController textController = TextEditingController();

  var isLoading = false.obs;

  // Expose controllerOne here as a public variable or getter
  // final MyAllPostScreenController controllerOne = Get.find<MyAllPostScreenController>();

  var userProfileInfo = GetUser().obs;
  var singlePost = SinglePostDataModel().obs;
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    if(Get.arguments != null){
      log("===========================Here in init=================================");
      log("===========================postId: ${Get.arguments}=================================");
      isLoading.value = true;
      log("===========================Here making true=================================");
      await  Future.wait([
        fetchProfile(),
        getSinglePost(Get.arguments)
      ]);
      //await fetchProfile();

      log("===========================After fetched Profile=================================");
      //await getSinglePost(Get.arguments);
      log("===========================After fetched post=================================");
      isLoading.value = false;
      log("===========================Loader False=================================");
    }
  }

  Future<void> fetchProfile() async{
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
  }

  Future<void> getSinglePost(String id) async {
    try {
      //  showProgressIndicator();
      final response =
      await NetworkCaller().getRequest("${AppUrls.getSinglePost}/$id");
      if (response.isSuccess && response.statusCode == 200) {
        final data = response.responseData;
        singlePost.value = SinglePostDataModel.fromJson(data);
      } else if (response.statusCode == 404) {
        AppSnackBar.showError('Data Not Found');
      } else {
        AppSnackBar.showError('Something Went Wrong');
      }
    } catch (e) {
      log('Something went Wrong $e');
    } finally {
      //  hideProgressIndicator();
    }
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
