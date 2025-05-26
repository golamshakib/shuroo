import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';

import '../../../core/utils/constants/image_path.dart';

class HomeController extends GetxController{

  final commentTEController = TextEditingController().obs;
  var replyOf = ''.obs;
  var addComment = true.obs;
  var commentHint = "Add a comment...".obs;
  final FocusNode controllerNode = FocusNode();

  final List<String> item = [

    ImagePath.photo_home,
    ImagePath.photo_home,
    ImagePath.photo_home,
    ImagePath.photo_home,

  ];

  RxList<Map<String, dynamic>> commentList = [
    {
      'id' : '0',
      'image' : IconPath.icon_pro,
      'name' : "Johan Ronsse",
      'designation' : "Designer & Educator",
      "time" : "2d",
      "comment" : "Why are these not visible for viewers?",
      "like" : 1,
      'reply' : 1,
      'replies' : [
        {
          'image' : IconPath.icon_pro,
          'name' : "Johan Ronsse",
          'designation' : "Designer & Educator",
          "time" : "2d",
          "comment" : "Why are these not visible for viewers?",
          "like" : 1,
          'reply' : ""
        },
      ].obs
    },
    {
      'id' : '1',
      'image' : IconPath.icon_pro,
      'name' : "Johan Ronsse",
      'designation' : "Designer & Educator",
      "time" : "2d",
      "comment" : "Why are these not visible for viewers?",
      "like" : 1,
      'reply' : 1,
      'replies' : [
        {
          'image' : IconPath.icon_pro,
          'name' : "Johan Ronsse",
          'designation' : "Designer & Educator",
          "time" : "2d",
          "comment" : "Why are these not visible for viewers?",
          "like" : 1,
          'reply' : ""
        },
      ].obs
    }
  ].obs;


  void addCommentFunction(String comment){
    final addBody = {
      'id' : commentList.length.toString(),
      'image' : IconPath.icon_pro,
      'name' : "Johan Ronsse",
      'designation' : "Designer & Educator",
      "time" : "2d",
      "comment" : comment,
      "like" : 1,
      'reply' : 1,
      'replies' : [].obs
    };
    commentList.add(addBody);
    commentTEController.value.text = "";
    addComment.value = true;
  }

  void addReplyFunction(String comment){
    final addBody = {
      'image' : IconPath.icon_pro,
      'name' : "Johan Ronsse",
      'designation' : "Designer & Educator",
      "time" : "2d",
      "comment" : comment,
      "like" : 1,
      'reply' : 1,
    };
    commentList.value[int.parse(replyOf.value)]["replies"].add(addBody);
    commentTEController.value.text = "";
    addComment.value = true;
  }



}