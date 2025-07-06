import 'dart:developer';


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../../../../../core/services/Auth_service.dart';
import '../../../../../core/services/network_caller.dart';
import '../../../../../core/utils/constants/app_urls.dart';
import '../model/chat_list_model.dart';



class MessageScreenController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();

  Rx<GetChatListModel?> chatlists = Rx<GetChatListModel?>(null);

  String? token = AuthService.token;
  Future<void> getMyChatList() async {
    try {
      final response = await networkCaller.getRequest(AppUrls.getMyChatLists,
          token: 'Bearer $token');
      if (response.isSuccess) {
        chatlists.value = GetChatListModel.fromJson(response.responseData);
        update();
      } else {
        //errorSnakbar(errorMessage: response.errorMessage);
        debugPrint(response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(const Duration(microseconds: 200), () {
      getMyChatList();
    });
  }
}