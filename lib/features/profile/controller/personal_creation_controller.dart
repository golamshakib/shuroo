import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/features/profile/data/user_data_model.dart';

import '../../../core/utils/constants/icon_path.dart';

class PersonalCreationController extends GetxController {
  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  final aboutTEController = TextEditingController();

  RxBool educationEdit = false.obs;
  RxBool experienceEdit = false.obs;
  RxBool skillEdit = false.obs;
  RxBool toolsEdit = false.obs;
  RxBool interestEdit = false.obs;
  RxBool languageEdit = false.obs;

  RxList<Map<String, dynamic>> educationList = [
    {
      "imagePath": IconPath.educationIcon,
      "name": "Brookfield University",
      "department": "Bachelor of Science in Environmental Science",
      "start": "2025",
      'end': "Present"
    },
    {
      "imagePath": IconPath.educationIcon,
      "name": "Brookfield University",
      "department": "Bachelor of Science in Environmental Science",
      "start": "2025",
      'end': "Present"
    },
  ].obs;

  RxList<Map<String, dynamic>> experienceList = [
    {
      "imagePath": IconPath.educationIcon,
      "position": "Sustainability Intern",
      "companyName": "Green Earth Foundation",
      "start": "2025",
      'end': "Present",
      "description":
          "Conducted research on sustainable farming practices and climate change mitigation."
    },
    {
      "imagePath": IconPath.educationIcon,
      "position": "Sustainability Intern",
      "companyName": "Green Earth Foundation",
      "start": "2025",
      'end': "Present",
      "description":
          "Conducted research on sustainable farming practices and climate change mitigation."
    },
  ].obs;

  RxList<String> skillList = [
    "Interface Design",
    "UI Design",
    "UX Design",
    "Branding Design",
    "Graphic Design",
    "Motion Design",
  ].obs;

  RxList<String> toolsList = [
    "Figma",
    "UI Design",
    "UX Design",
    "Branding Design",
    "Graphic Design",
    "Motion Design",
  ].obs;

  RxList<String> interestList = [
    "Climate Chane Advocacy",
    "UI Design",
    "UX Design",
    "Branding Design",
    "Graphic Design",
    "Motion Design",
  ].obs;

  RxList<String> languageList = [
    "English",
    "Arabic",
    "Bangla",
    "Franch",
    "Spanish",
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
  final languageTEController = TextEditingController();

  var profilePath = "".obs;
  void pickProfile() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profilePath.value = image.path;
    }
  }

  void addEducation() {
    final addBody = {
      "imagePath": IconPath.educationIcon,
      "name": instituteNameTEController.text,
      "department": degreeTEController.text,
      "start": startTEController.text,
      'end': endTEController.text
    };
    educationList.add(addBody);
  }

  void addExperience() {
    final addBody = {
      "imagePath": IconPath.educationIcon,
      "position": titleTEController.text,
      "companyName": companyNameTEController.text,
      "start": startExperienceTEController.text,
      'end': endExperienceTEController.text,
      "description": describeTEController.text
    };
    experienceList.add(addBody);
  }

  void addSkill() {
    skillList.add(skillTEController.text);
    skillTEController.clear();
  }

  void addTechnology() {
    toolsList.add(technologyTEController.text);
  }

  void addInterest() {
    interestList.add(interestTEController.text);
  }

  void addLanguage() {
    languageList.add(languageTEController.text);
  }

  var userProfile = GetUser().obs;

  // Get Profile =====================

  Future<void> getProfile() async {
    try {
      final response = await NetworkCaller()
          .getRequest(AppUrls.getUserProfile, token: AuthService.token);

      if (response.isSuccess && response.statusCode == 200) {
        userProfile.value = GetUser.fromJson(response.responseData);
        AppSnackBar.showSuccess('Data Get Successfully');
      } else if (response.statusCode == 404) {
        AppSnackBar.showError('Data Not Found');
      }
    } catch (e) {
      print('Something went wrong $e');
      AppSnackBar.showError('Data Not Found $e');
    }
  }

  // Experience ======================

  Future<void> experienceAdd() async {
    final requestBody = {
      'title': titleTEController.text.trim(),
      'company': companyNameTEController.text.trim(),
      'startDate': startExperienceTEController.text.trim(),
      'endDate': endExperienceTEController.text.trim(),
      'description': describeTEController.text.trim()
    };

    try {
      final response = await NetworkCaller().postRequest(
          AppUrls.createExperience,
          body: requestBody,
          token: AuthService.token);

      if (response.isSuccess && response.statusCode == 201) {
        AppSnackBar.showSuccess('Create experience successfully');
      } else {
        AppSnackBar.showError('Something Went Wrong');
      }
    } catch (e) {
      print('Somethint went wrong $e');
      AppSnackBar.showError('Something Went Wrong $e');
    }
  }

  Future<void> deleteExperience(String id) async {
    try {
      final response = await NetworkCaller().deleteRequest(
          AppUrls.experienceDelete(id), "Bearer ${AuthService.token}");

      if (response.isSuccess) {
        AppSnackBar.showError("Removed from favorite!");
        reFresh();
      } else {
        AppSnackBar.showError(response.statusCode.toString());
      }
    } catch (e) {
      AppSnackBar.showError(e.toString());
    }
  }

  // Educaton ================
  Future<void> educationAdd() async {
    final requestBody = {
      'title': titleTEController.text.trim(),
      'company': companyNameTEController.text.trim(),
      'startDate': startExperienceTEController.text.trim(),
      'endDate': endExperienceTEController.text.trim(),
      'description': describeTEController.text.trim()
    };

    try {
      final response = await NetworkCaller().postRequest(
          AppUrls.createEducation,
          body: requestBody,
          token: AuthService.token);

      if (response.isSuccess && response.statusCode == 201) {
        AppSnackBar.showSuccess('Create experience successfully');
      } else {
        AppSnackBar.showError('Something Went Wrong');
      }
    } catch (e) {
      print('Somethint went wrong $e');
      AppSnackBar.showError('Something Went Wrong $e');
    }
  }

  void reFresh() {
    update();
  }
}
