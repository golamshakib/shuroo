

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants/icon_path.dart';

class PersonalCreationController extends GetxController{

  final aboutTEController = TextEditingController();

  RxBool educationEdit = false.obs;
  RxBool experienceEdit = false.obs;

  RxList<Map<String, dynamic>> educationList = [
    {
      "imagePath" : IconPath.educationIcon,
      "name" : "Brookfield University",
      "department" : "Bachelor of Science in Environmental Science",
      "start" : "2025",
      'end' : "Present"
    },
    {
      "imagePath" : IconPath.educationIcon,
      "name" : "Brookfield University",
      "department" : "Bachelor of Science in Environmental Science",
      "start" : "2025",
      'end' : "Present"
    },
  ].obs;

  RxList<Map<String, dynamic>> experienceList = [
    {
      "imagePath" : IconPath.educationIcon,
      "position" : "Sustainability Intern",
      "companyName" : "Green Earth Foundation",
      "start" : "2025",
      'end' : "Present",
      "objectives" : [
        "Conducted research on sustainable farming practices and climate change mitigation.",
        "Assisted in community outreach programs focused on environmental awareness."
      ]
    },
    {
      "imagePath" : IconPath.educationIcon,
      "position" : "Sustainability Intern",
      "companyName" : "Green Earth Foundation",
      "start" : "2025",
      'end' : "Present",
      "objectives" : [
        "Conducted research on sustainable farming practices and climate change mitigation.",
        "Assisted in community outreach programs focused on environmental awareness."
      ]
    },

  ].obs;

}