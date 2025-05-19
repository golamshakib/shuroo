import 'package:get/get.dart';

import '../../../core/utils/constants/will_be_deleted.dart';
import '../data/model/messages_model.dart';

class MessagesController extends GetxController{
  final List<MessagesModel> messageList = [
    MessagesModel(
      id: 1,
      title: "Apply Now",
      subTitle: "Hi there! I came across your recruitment services and I’m currently exploring new...",
      name: "Eventbrite",
      time: "3h ago",
      uiImagePath: WillBeDeleted.uiLogo,
    ),
    MessagesModel(
      id: 2,
      title: "Welcome",
      subTitle: "Hi there! I came across your recruitment services and I’m currently exploring new...",
      name: "Nike",
      time: "3h ago",
      uiImagePath: WillBeDeleted.ecoLogo,
    ),
    MessagesModel(
      id: 3,
      title: "Apply Now",
      subTitle: "Hi there! I came across your recruitment services and I’m currently exploring new...",
      name: "Eventbrite",
      time: "3h ago",
      uiImagePath: WillBeDeleted.uiLogo,
    ),
    MessagesModel(
      id: 4,
      title: "Welcome",
      subTitle: "Hi there! I came across your recruitment services and I’m currently exploring new...",
      name: "Nike",
      time: "3h ago",
      uiImagePath: WillBeDeleted.ecoLogo,
    ),
    MessagesModel(
      id: 5,
      title: "Welcome",
      subTitle: "Hi there! I came across your recruitment services and I’m currently exploring new...",
      name: "Nike",
      time: "3h ago",
      uiImagePath: WillBeDeleted.ecoLogo,
    ),
    MessagesModel(
      id: 5,
      title: "Apply Now",
      subTitle: "Hi there! I came across your recruitment services and I’m currently exploring new...",
      name: "Eventbrite",
      time: "3h ago",
      uiImagePath: WillBeDeleted.uiLogo,
    ),
    MessagesModel(
      id: 6,
      title: "Welcome",
      subTitle: "Hi there! I came across your recruitment services and I’m currently exploring new...",
      name: "Nike",
      time: "3h ago",
      uiImagePath: WillBeDeleted.ecoLogo,
    ),

  ];
}