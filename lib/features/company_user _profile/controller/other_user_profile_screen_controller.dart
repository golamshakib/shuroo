import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/features/company_user%20_profile/data/others_user_information_data_model.dart';

class OtherUserProfileScreenControllar extends GetxController
    with GetSingleTickerProviderStateMixin {
  
  late TabController tabController;

  var userId = "".obs;
  var othersUserProfile = OtherUserInformation().obs;

  OtherUserProfileScreenControllar();

 @override
void onInit() async{
  super.onInit();
  tabController = TabController(length: 2, vsync: this);

  if (Get.arguments != null) {
    if (Get.arguments is String) {
      userId.value = Get.arguments;
    } else if (Get.arguments is Map && Get.arguments['userId'] != null) {
      userId.value = Get.arguments['userId'];
    } else {
      Future.microtask(() {
        AppSnackBar.showError("No user ID provided");
      });
      return;
    }
    print("Received userId: ${userId.value}");
    await getOthersProfile(userId.value);
  } else {
    Future.microtask(() {
      AppSnackBar.showError("No user ID provided");
    });
  }
}

  Future<void> getOthersProfile(String userId) async {
    try {
      final response = await NetworkCaller().getRequest(
        "${AppUrls.othersUserProfile}/$userId",
        token: "Bearer ${AuthService.token}",
      );

      if (response.isSuccess && response.statusCode == 200) {
        othersUserProfile.value =
            OtherUserInformation.fromJson(response.responseData);
      } else if (response.statusCode == 404) {
        Future.microtask(() => AppSnackBar.showError('Data Not Found'));
      } else {
        Future.microtask(() => AppSnackBar.showError('Failed to fetch data'));
      }
    } catch (e) {
      print('Something went wrong $e');
      Future.microtask(() => AppSnackBar.showError('Data Not Found: $e'));
    }
  }
}
