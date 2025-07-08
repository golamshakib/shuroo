import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../controllers/chat_list_controller.dart';
import '../../controllers/chat_screen_controller.dart';
import 'chat_details_screen.dart';

class InboxScreen extends StatelessWidget {
  InboxScreen({super.key});

  final controller = Get.put(ChatListController());
  final chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    controller.fetchChatListDetails();
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        color: AppColors.primary,
        backgroundColor: Colors.white,
        onRefresh: () async{
          await controller.fetchChatListDetails();
        },
        child: SafeArea(
          child: Obx(() {
            final chatLists = controller.chatListDetails.value;

            // Sort the messages by 'lastMessageDate' in descending order
            chatLists?.data?.sort((a, b) {
              // Parse the dates and compare
              DateTime aDate = DateTime.parse(a.lastMessageDate.toString());
              DateTime bDate = DateTime.parse(b.lastMessageDate.toString());
              return bDate.compareTo(aDate);  // descending order
            });

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// top header
                const SizedBox(height: 8),

                Expanded(
                  child: controller.isLoading.value
                      ? const ShimmerWidgets()
                      : chatLists?.data == null || chatLists!.data!.isEmpty
                      ? const Center(child: CustomText(text: "No messages"))
                      : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: chatLists.data!.length,
                    itemBuilder: (context, index) {
                      final chat = chatLists.data![index];

                      return GestureDetector(
                        onTap: () {
                          chatController.createChatRoom(user2Id: chat.user?.id ?? '');
                          Get.to(() => ChatInboxScreen(
                            receiverId: chat.user?.id ?? '',
                            userName: chat.user?.name ?? '',
                            image: chat.user?.image ?? 'null',
                          ));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipOval(
                                child: chat.user?.image != null && chat.user!.image!.isNotEmpty ?
                                Image.network(chat.user!.image!, fit: BoxFit.fill, width: 44.w, height: 44.h,) :
                                Image.asset(ImagePath.dummyProfilePicture, fit: BoxFit.fill, width: 44.w, height: 44.h,),
                              ),
                              const SizedBox(width: 12),

                              // Texts
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: chat.user?.name ?? 'Unknown User',
                                    ),
                                    SizedBox(height: 4.h),
                                    RichText(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(
                                        text: chat.lastMessage ?? 'No message',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '  •  ${getTimeAgo(chat.lastMessageDate.toString())}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[400], // Grey200
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  String getTimeAgo(String? isoDateString) {
    if (isoDateString == null || isoDateString.isEmpty) return '';
    try {
      final dateTime = DateTime.parse(isoDateString).toLocal();
      final now = DateTime.now();
      final diff = now.difference(dateTime);

      if (diff.inMinutes < 1) return 'now';
      if (diff.inMinutes < 60) return '${diff.inMinutes} min ago';
      if (diff.inHours < 24) return '${diff.inHours} hr ago';
      if (diff.inDays < 7) return '${diff.inDays} day${diff.inDays > 1 ? 's' : ''} ago';

      return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
    } catch (_) {
      return '';
    }
  }
}

/// shimmer widgets
class ShimmerWidgets extends StatelessWidget {
  const ShimmerWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 15.h),
      itemCount: 5,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: SizedBox(
                  height: 60.h,
                  width: 60.w,
                  child: CircleAvatar(backgroundColor: Colors.grey),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 20.h,
                        width: 150.w,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 15.h,
                        width: 100.w,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(height: 15.h, width: 60.w, color: Colors.grey),
              ),
              SizedBox(width: 10.w),
            ],
          ),
        );
      },
    );
  }
}
