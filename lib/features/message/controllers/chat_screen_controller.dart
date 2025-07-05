import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shuroo/features/message/controllers/web_socket_client.dart';

import '../../../../core/services/Auth_service.dart';
import '../../../../core/utils/constants/app_urls.dart';
import '../../profile/controller/profile_information_controller.dart';




class ChatController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final WebSocketClient socketClient = WebSocketClient();

  // final homeScreenController = Get.find<HomeScreenController>();
  // final businessHomeController = Get.find<BusinessHomeController>();
  final profileInformationController = Get.find<ProfileInformationController>();

  RxString userId = ''.obs;
  @override
  void onInit() {
    super.onInit();
    socketClient.connect(AppUrls.connectSocket);
    socketClient.setOnMessageReceived((message) {
      log("Raw WebSocket Message Received: $message");
      _handleIncomingMessage(message);
    });
    /// Initialize userId safely
    final role = "USER";//AuthService.userRole;
    if (role == 'USER') {
      final id = profileInformationController.userProfile.value.data?.id?.toString();
      if (id != null) {
        userId.value = id;
      }
    }
    // else if (role == 'BUSINESS_PARTNER') {
    //   final id = businessHomeController.userInformation.data?.id?.toString();
    //   if (id != null) {
    //     userId.value = id;
    //   }
    // }
  }

  var messages = <Map<String, dynamic>>[].obs;
  RxBool showAttuchIcon = true.obs;
  RxString selectedImage = "".obs;
  RxString roomId = "".obs;
  RxString generatedImageLink = "".obs;
  showSendbox() {
    if (textController.text.isEmpty) {
      showAttuchIcon.value = true;
    } else {
      showAttuchIcon.value = false;
    }
  }

  //Chat Function Starts from here

  // Create Chat room
  Future<void> createChatRoom({
    required String user2Id,
  }) async {
    final userId = profileInformationController.userProfile.value.data?.id?.toString();
    //final id = await AuthService.getId();
    log(" hello brother: $userId  ");
    socketClient.joinRoom(userId, user2Id);
    log(" hello brother reciever: $user2Id  ");
  }

  Future<void> sendMessage({
    required String message,
    required String reciverId,
    String? image,
  }) async {
    log(message);
    // Prevent sending empty messages with no image
    if (message.isEmpty && (image == null || image.isEmpty)) {
      return;
    }

    try {
      final Map<String, dynamic> messageBody = {
        "type": "sendMessage",
        "chatroomId":roomId.value,
        "senderId": profileInformationController.userProfile.value.data?.id?.toString(),
        "receiverId": reciverId,
        "content": message,
        //"file": (image != null && image.isNotEmpty) ? image : "",
      };

      socketClient.sendMessage(messageBody);
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  //message status change
  void viewMessage() {
    log("View Message Called");
    String? id = profileInformationController.userProfile.value.data?.id?.toString();
    socketClient.viewMessage(roomId.value, id!);
  }

  void updateMessageStatus(int index, String status) {
    if (index >= 0 && index < messages.length) {
      messages[index]['sentStatus'] = status;
      messages.refresh();
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = image.path;
    }
  }

  /// Generate image link
  Future<void> generateImageLink() async {
    final dio.Dio dioClient = dio.Dio();
    dioClient.options = dio.BaseOptions(
      connectTimeout: const Duration(seconds: 12),
      validateStatus: (status) {
        return status! < 500;
      },
    );
    try {
      print("************************");
      final imageFile1 = await dio.MultipartFile.fromFile(
        selectedImage.value,
        filename: selectedImage.value.split('/').last,
      );


      final formData = dio.FormData.fromMap({
        "file": imageFile1,
      });

      final response = await dioClient.post(AppUrls.generateImageLink,
          data: formData,
          options: dio.Options(headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': AuthService.token,
          }));

      if (response.statusCode == 200) {
        // final responseData = jsonDecode(response.data);
        final imageLink = response.data["data"]["file"];
        log("Generated Image Link $imageLink");
        generatedImageLink.value = imageLink;
      }
    } catch (e) {
      log("something went wrong, error: $e");
    }
  }



  void _handleIncomingMessage(String rawMessage) {
    final decodedMessage = jsonDecode(rawMessage);

    if (decodedMessage['type'] == 'loadMessages') {
      final conversation = decodedMessage['conversation'];
      if (conversation != null && conversation['id'] != null) {
        roomId.value = conversation['id'];
        messages.clear();
        for (var msg in conversation['messages']) {
          _addMessage(
            msg['id'],
            msg['content'],
            msg['senderId'],
            msg['conversationId'],
            msg['isRead'],
            msg['updatedAt'],
            msg['file'] ?? "",
          );
        }
      }
    } else if (decodedMessage['type'] == 'receiveMessage' ||
        decodedMessage['type'] == 'messageSent') {
      final message = decodedMessage['message'];
      if (message != null) {
        _addMessage(
          message['id'],
          message['content'],
          message['senderId'],
          message['conversationId'],
          message['isRead'],
          message['updatedAt'],
          message['file'] ?? "",
        );
      }
    }
  }
  void _addMessage(
      String messageId,
      String content,
      String senderId,
      String conversationId,
      bool isRead,
      String updatedAt,
      String fileUrl, // Change List<dynamic> to String
      ) {
    if (!messages.any((msg) => msg['id'] == messageId)) {
      messages.add({
        'id': messageId,
        'content': content,
        'senderId': senderId,
        'conversationId': conversationId,
        'isRead': isRead,
        'updatedAt': updatedAt,
        'file': fileUrl, // Store as a String instead of List
      });
      debugPrint("Added message: $content from $senderId with file: $fileUrl");
    } else {
      debugPrint("Duplicate message ignored: $content from $senderId");
    }
  }}