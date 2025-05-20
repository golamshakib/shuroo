import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shuroo/features/search_notification_chat/data/model/notification_model.dart';

class NotificationController extends GetxController{

  final TextEditingController search = TextEditingController();

  final List<NotificationModel> notificationList = [
    NotificationModel(
      id: 1,
      title: "You're shortlisted!",
      time: "3h ago",
      subTitle: "Hi there! I came across your recruitment services and I’m currently exploring new...",
    ),
    NotificationModel(
      id: 2,
      title: "You're shortlisted!",
      time: "3h ago",
      subTitle: "Hi there! I came across your recruitment services and I’m currently exploring new...",
    ),

  ];
}