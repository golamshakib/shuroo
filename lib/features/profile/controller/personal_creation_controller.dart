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

  Future<void> refreshProfile() async {
    await userProfile();
  }

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
    // {
    //   "imagePath": IconPath.educationIcon,
    //   "position": "Sustainability Intern",
    //   "companyName": "Green Earth Foundation",
    //   "start": "2025",
    //   'end': "Present",
    //   "description":
    //       "Conducted research on sustainable farming practices and climate change mitigation."
    // },
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

// Upload User Data

  // var favoriteJobIds = <String>{}.obs;

  // Future<void> addFavorite(String id) async {
  // //  isLoading.value = true;
  //   try {
  //     final response = await NetworkCaller().postRequest(
  //       "${AppUrls.addFavorite}/$id",
  //       body: {},
  //       token: "Bearer ${AuthService.token}",
  //     );
  //     if (response.isSuccess) {
  //       favoriteJobIds.add(id);
  //       requestToGetFavorite();
  //       favoriteJobIds.refresh();
  //       AppSnackBar.showSuccess("Favorite added successfully!");
  //     } else if (response.statusCode == 400) {
  //       AppSnackBar.showSuccess("Favorite already exists");
  //       favoriteJobIds.add(id); // Optional: trust API
  //     } else {
  //       AppSnackBar.showError("Failed to add to favorite.");
  //     }
  //   } catch (e) {
  //     AppSnackBar.showError(e.toString());
  //   } finally {
  //   //  isLoading.value = false;
  //   }
  // }

  var userProfile = GetUser().obs;

  // Get Profile =====================

  Future<void> getProfile() async {
    try {
      final response = await NetworkCaller().getRequest(AppUrls.getUserProfile,
          token: "Bearer ${AuthService.token}");

      if (response.isSuccess && response.statusCode == 200) {
        userProfile.value = GetUser.fromJson(response.responseData);
        userProfile.refresh();
        //  AppSnackBar.showSuccess('Data Get Successfully');
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
    final title = titleTEController.text.trim();
    final company = companyNameTEController.text.trim();
    final startDate = startExperienceTEController.text.trim();
    final endDate = endExperienceTEController.text.trim();
    final desc = describeTEController.text.trim();
    final requestBody = {
      'title': title,
      'company': company,
      'startDate': startDate,
      'endDate': endDate,
      'description': desc
    };

    try {
      final response = await NetworkCaller().postRequest(
          AppUrls.createExperience,
          body: requestBody,
          token: "Bearer ${AuthService.token}");

      if (response.isSuccess && response.statusCode == 201) {
        AppSnackBar.showSuccess('Create experience successfully');
        await getProfile();
        titleTEController.clear();
        companyNameTEController.clear();
        startExperienceTEController.clear();
        endExperienceTEController.clear();
        describeTEController.clear();
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
          "${AppUrls.experienceDelete}/$id", "Bearer ${AuthService.token}");

      if (response.isSuccess) {
        AppSnackBar.showSuccess("Experience deleted successfully!");
        await getProfile();
      } else {
        AppSnackBar.showError("Failed to delete: ${response.statusCode}");
      }
    } catch (e) {
      AppSnackBar.showError("Error: ${e.toString()}");
    }
  }

  // Educaton ================
  Future<void> educationAdd() async {
    final requestBody = {
      'institute': instituteNameTEController.text.trim(),
      'degreeName': majorSubjectTEController.text.trim(),
      'fieldOfStudy': minorSubjectTEController.text.trim(),
      'grade': double.tryParse(degreeTEController.text.trim()),
      'startDate': startTEController.text.trim(),
      'endDate': endTEController.text.trim()
    };

    try {
      final response = await NetworkCaller().postRequest(
          AppUrls.createEducation,
          body: requestBody,
          token: "Bearer ${AuthService.token}");
      print(requestBody);

      if (response.isSuccess && response.statusCode == 201) {
        AppSnackBar.showSuccess('Create experience successfully');
        await getProfile();
        instituteNameTEController.clear();
        majorSubjectTEController.clear();
        minorSubjectTEController.clear();
        degreeTEController.clear();
        startTEController.clear();
        endTEController.clear();
      } else {
        AppSnackBar.showError('Something Went Wrong');
      }
    } catch (e) {
      print('Somethint went wrong $e');
      AppSnackBar.showError('Something Went Wrong $e');
    }
  }

  Future<void> deleteEducation(String id) async {
    try {
      final response = await NetworkCaller().deleteRequest(
          "${AppUrls.educationDelete}/$id", "Bearer ${AuthService.token}");

      if (response.isSuccess) {
        AppSnackBar.showSuccess("Education deleted successfully!");
        await getProfile();
      } else {
        AppSnackBar.showError("Failed to delete: ${response.statusCode}");
      }
    } catch (e) {
      AppSnackBar.showError("Error: ${e.toString()}");
    }
  }

  void reFresh() {
    update();
  }
}
