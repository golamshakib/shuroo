import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';
import 'package:shuroo/features/profile/controller/profile_information_controller.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../controllers/chat_list_controller.dart';
import '../../controllers/chat_screen_controller.dart';
import '../../controllers/message_screen_controller.dart';
import '../widgets/message_input_box.dart';

import '../widgets/message_sent_by_me.dart';
import '../widgets/recieve_message.dart';

class ChatInboxScreen extends StatefulWidget {
  const ChatInboxScreen({
    super.key,
    required this.receiverId,
    required this.userName,
    required this.image,
  });

  final String receiverId;
  final String userName;
  final String image;

  @override
  State<ChatInboxScreen> createState() => _ChatInboxScreenState();
}

class _ChatInboxScreenState extends State<ChatInboxScreen> {
  final ChatController chatController = Get.put(ChatController());
  final MessageScreenController messageScreenController = Get.put(
    MessageScreenController(),
  );
  // final homeScreenController = Get.find<HomeScreenController>();
  // final businessHomeController = Get.find<BusinessHomeController>();
  final profileInformationController = Get.find<ProfileInformationController>();
  final controller = Get.put(ChatListController());
  RxString userId = ''.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatController.createChatRoom(user2Id: widget.receiverId);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  widget.image != 'null' ?
                  Image.network(widget.image, fit: BoxFit.fill, width: 44.w, height: 44.h,) :
                      Image.asset(ImagePath.dummyProfilePicture, fit: BoxFit.fill, width: 44.w, height: 44.h,),
                  // Container(
                  //   width: 44.w,
                  //   height: 48.h,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     color: Colors.grey[300],
                  //     image:
                  //         widget.image.isNotEmpty
                  //             ? DecorationImage(
                  //               image: NetworkImage(widget.image),
                  //               fit: BoxFit.cover,
                  //             )
                  //             : DecorationImage(
                  //           image: AssetImage(ImagePath.dummyProfilePicture),
                  //           fit: BoxFit.cover,
                  //         ),
                  //   ),
                  //   child:
                  //       widget.image.isEmpty
                  //           ? const Icon(
                  //             Icons.person,
                  //             size: 30,
                  //             color: Colors.white,
                  //           )
                  //           : null,
                  // ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: widget.userName,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      CustomText(
                        text:  'Active Now',
                        fontSize: 10.sp,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: Obx(() {
                  if (chatController.messages.isNotEmpty) {
                    Future.delayed(const Duration(milliseconds: 200), () {
                      chatController.viewMessage();
                    });
                  }
                  return ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 8,
                    ),
                    itemCount: chatController.messages.length,
                    itemBuilder: (context, index) {
                      final message =
                          chatController.messages.reversed.toList()[index];
                      // final image =
                      //     chatController.generatedImageLink.value.isNotEmpty
                      //         ? chatController.generatedImageLink.value
                      //         : "";
                      return message["senderId"] == userId.value
                          ? MessageSentByMe(
                            message: message['content'],
                            time: message['updatedAt'],
                            image:
                                (message["file"] != null &&
                                        message["file"].isNotEmpty)
                                    ? message["file"]
                                    : "",
                          )
                          : ReceivedMessage(
                            message: message['content'],
                            time: message['updatedAt'],
                            image:
                                (message["file"] != null &&
                                        message["file"].isNotEmpty)
                                    ? message["file"]
                                    : "",
                          );
                    },
                  );
                }),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Obx(
                  () =>
                      chatController.selectedImage.isNotEmpty
                          ? Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Stack(
                              children: [
                                Container(
                                  height: 100.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                      image: FileImage(
                                        File(chatController.selectedImage.value),
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 1,
                                  top: 2,
                                  child: GestureDetector(
                                    onTap: () {
                                     // chatController.selectedImage.value = "";
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      shadows: [Shadow()],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          : const SizedBox.shrink(),
                ),
              ),
              MessageInputBox(
                chatController: chatController,
                receiverId: widget.receiverId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
