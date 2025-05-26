import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';

import '../../../core/utils/constants/image_path.dart';

class HomeController extends GetxController{

  final commentTEController = TextEditingController().obs;
  final List<String> item = [

    ImagePath.photo_home,
    ImagePath.photo_home,
    ImagePath.photo_home,
    ImagePath.photo_home,

  ];

  RxList<Map<String, dynamic>> commentList = [
    {
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




}