
import 'package:flutter/material.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';


import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../core/common/widgets/custom_textform_field.dart';
import '../../controllers/chat_screen_controller.dart';


class MessageInputBox extends StatelessWidget {
  final ChatController chatController;
  final String receiverId;

  const MessageInputBox({
    super.key,
    required this.chatController,
    required this.receiverId,
  });

  @override
  Widget build(BuildContext context) {
    return
      Container(
          decoration: BoxDecoration(
              //border: Border.all(color: AppColors.textformFieldBorder),
              color: Colors.white
          ),
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 9,
                child: CustomTextFormField(
                  controller: chatController.textController,
                  hintText: "Type a message",
                ),
              ),
              SizedBox(width: 8.w,),
              // Flexible(
              //   flex: 2,
              //   child: SizedBox(
              //     height: 54,
              //     width: 54,
              //     child: GestureDetector(
              //       onTap: (){
              //
              //       },
              //       child: Container(
              //         height: double.infinity,
              //         width: double.infinity,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(getWidth(4)),
              //             color: Colors.white,
              //             border: Border.all(color: AppColors.textformFieldBorder)
              //         ),
              //         child: Icon(Icons.link),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(width: getWidth(8),),
              Flexible(
                flex: 2,
                child: SizedBox(
                  height: 48.h,
                  width: 48.w,
                  child: GestureDetector(
                    onTap: () async {
                      String? imageUrl;

                      // If an image is selected, upload it and get the link
                      // if (chatController.selectedImage.value.isNotEmpty) {
                      //   await chatController.generateImageLink();
                      //   imageUrl = chatController.generatedImageLink.value;
                      // }

                      // Send message with the uploaded image (if available)
                      chatController.sendMessage(
                        message: chatController.textController.text,
                        receiverId: receiverId,
                        image: imageUrl,
                      );

                      // Reset UI state
                      chatController.selectedImage.value = "";
                      chatController.textController.clear();
                      chatController.showAttuchIcon.value = true;
                    },
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.w),
                          color: AppColors.primary,
                          border: Border.all(color: AppColors.textSecondary)
                      ),
                      child: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                    ),
                  ),
                ),
              ),
            ],
          )

     );
  }
}
