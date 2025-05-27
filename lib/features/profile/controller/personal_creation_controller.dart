

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
      "description" : "Conducted research on sustainable farming practices and climate change mitigation."
    },
    {
      "imagePath" : IconPath.educationIcon,
      "position" : "Sustainability Intern",
      "companyName" : "Green Earth Foundation",
      "start" : "2025",
      'end' : "Present",
      "description" : "Conducted research on sustainable farming practices and climate change mitigation."
    },

  ].obs;

  /// Add education

  final instituteNameTEController = TextEditingController();
  final majorSubjectTEController = TextEditingController();
  final minorSubjectTEController = TextEditingController();
  final degreeTEController = TextEditingController();
  final startTEController = TextEditingController();
  final endTEController = TextEditingController();

  /// Add experience

  final titleTEController = TextEditingController();
  final companyNameTEController = TextEditingController();
  final describeTEController = TextEditingController();
  final startExperienceTEController = TextEditingController();
  final endExperienceTEController = TextEditingController();

  /// Add etc

  final skillTEController = TextEditingController();
  final technologyTEController = TextEditingController();
  final interestTEController = TextEditingController();
  final languageExperienceTEController = TextEditingController();

  var profilePath = "".obs;
  void pickProfile() async{
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      profilePath.value = image.path;
    }
  }

  void addEducation(){

    final addBody = {
      "imagePath" : IconPath.educationIcon,
      "name" : instituteNameTEController.text,
      "department" : degreeTEController.text,
      "start" : startTEController.text,
      'end' : endTEController.text
    };
    educationList.add(addBody);
  }

  void addExperience(){

    final addBody = {
      "imagePath" : IconPath.educationIcon,
      "position" : titleTEController.text,
      "companyName" : companyNameTEController.text,
      "start" : startExperienceTEController.text,
      'end' : endExperienceTEController.text,
      "description" : describeTEController.text
    };
    experienceList.add(addBody);
  }
}