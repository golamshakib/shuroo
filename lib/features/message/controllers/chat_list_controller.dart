import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../../core/services/Auth_service.dart';
import '../../../../../core/services/network_caller.dart';
import '../../../../../core/utils/constants/app_urls.dart';
import '../model/chat_list_model.dart';


class ChatListController extends GetxController{

  @override
  void onInit() {
    fetchChatListDetails();
    super.onInit();
  }
  var isLoading = false.obs;
  Rx<GetChatListModel?> chatListDetails = Rx(null);
  String? token = AuthService.token;
  // Function to fetch course details
  Future<void> fetchChatListDetails() async {
    isLoading.value = true;
    try {

      final response = await NetworkCaller().getRequest(AppUrls.getMyChatLists ,token: 'Bearer $token');

      if (response.isSuccess) {
        // Check if responseData is a String or Map
        if (response.responseData is Map<String, dynamic>) {
          chatListDetails.value = GetChatListModel.fromJson(response.responseData);
          debugPrint(chatListDetails.value.toString());
          log(chatListDetails.value.toString());
        } else {
          throw Exception('Unexpected response data format');
        }
      }
    } catch (e) {
      // Handle exceptions
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}