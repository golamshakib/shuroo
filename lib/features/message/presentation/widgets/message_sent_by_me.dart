
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/message/presentation/widgets/view_image_screen.dart';

import '../../../../../../core/common/widgets/custom_text.dart';

class MessageSentByMe extends StatelessWidget {
  final String message;
  final String time;
  final String? image;
  const MessageSentByMe({
    super.key,
    required this.message,
    required this.time,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        children: [
          if (image != null) ...[
            if (image!.isNotEmpty) ...[
              GestureDetector(
                onTap: () => Get.to(() => ViewImageScreen(imageUrl: image)),
                child: Image.network(
                  image!,
                  fit: BoxFit.fill,
                  height: 124.h,
                  width: 124.w,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ],

          if (message.isNotEmpty) ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 8,
                    bottom: 8,
                  ),
                  constraints: BoxConstraints(maxWidth: 260.w),
                  decoration: const BoxDecoration(
                    color: Color(0xff2972FF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                    ),
                  ),
                  child: CustomText(
                    text: message,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                CustomText(
                  text: formatTime(time),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}
String formatTime(String rawTime) {
  try {
    final dateTime = DateTime.parse(rawTime).toLocal();
    return DateFormat.jm().format(dateTime);
  } catch (e) {
    return rawTime; // fallback if parsing fails
  }
}
