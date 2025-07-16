import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/features/profile/data/user_data_model.dart';

import '../../../core/utils/constants/icon_path.dart';

class PersonalCreationController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await getProfile();
  }

  final aboutTEController = TextEditingController();

  RxBool educationEdit = false.obs;
  RxBool experienceEdit = false.obs;
  RxBool skillEdit = false.obs;
  RxBool toolsEdit = false.obs;
  RxBool interestEdit = false.obs;
  RxBool languageEdit = false.obs;

  /// <--- Added loading boolean
  var isLoading = false.obs;

  /// Show / Hide loader methods
  void showProgressIndicator() => isLoading.value = true;
  void hideProgressIndicator() => isLoading.value = false;

  Future<void> refreshProfile() async {
    await getProfile();
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
  ].obs;

  RxList<String> skillList = <String>[].obs;
  RxList<String> toolsList = <String>[].obs;
  RxList<String> interestList = <String>[].obs;
  RxList<String> languageList = <String>[].obs;

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
    final skill = skillTEController.text.trim();
    if (skill.isNotEmpty) {
      skillList.add(skill);
      skillTEController.clear();
      skillList.refresh();
    }
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

  Future<void> updateProfile() async {
    final Map<String, dynamic> requestBody = {
      "about": aboutTEController.text.trim(),
      "skills": skillList.toList(),
      "tools": toolsList.toList(),
      "interests": interestList.toList(),
      "languages": languageList.toList(),
    };

    try {
      await _sendPutRequestWithHeadersAndImagesOnly1(AppUrls.profileUpdate,
          requestBody, profilePath.value, "Bearer ${AuthService.token}");
      // showProgressIndicator();

      // final response = await NetworkCaller().putRequest(
      //   AppUrls.profileUpdate,
      //   body: requestBody,
      //   token: "Bearer ${AuthService.token}",
      // );

      // if (response.isSuccess) {
      //   AppSnackBar.showSuccess('Data updated successfully');
      //   await getProfile();
      // } else {
      //   AppSnackBar.showError(
      //       response.errorMessage ?? 'Failed to update profile');
      // }
    } catch (e) {
      AppSnackBar.showError('An error occurred: $e');
    } finally {
      hideProgressIndicator();
    }
  }

  Future<void> _sendPutRequestWithHeadersAndImagesOnly1(
    String url,
    Map<String, dynamic> body,
    String? imagePath,
    String? token,
  ) async {
    if (token == null || token.isEmpty) {
      AppSnackBar.showError('Token is invalid or expired.');

      return;
    }

    try {
      var request = http.MultipartRequest('PUT', Uri.parse(url));

      request.headers.addAll({
        'Authorization': "Bearer ${AuthService.token}",
      });

      request.fields['bodyData'] = jsonEncode(body);

      if (imagePath != null && imagePath.isNotEmpty) {
        print('Attaching image: $imagePath');
        request.files.add(await http.MultipartFile.fromPath(
          'profileImage',
          imagePath,
        ));
      }

      print('Request Headers: ${request.headers}');
      print('Request Fields: ${request.fields}');

      var response = await request.send();
      debugPrint("----------------------------------------------------------");

      debugPrint(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        await getProfile();
        AppSnackBar.showSuccess("Profile updated successfully!");
      } else {
        var errorResponse = await response.stream.bytesToString();
        print('Response error: $errorResponse');
        AppSnackBar.showError(errorResponse);
      }
    } catch (e) {
      print('Request error: $e');
      AppSnackBar.showError("Failed to update profile. Please try again.");
    }
  }

  var userProfile = GetUser().obs;

  // Get Profile =====================

  Future<void> getProfile() async {
    isLoading.value = true;
    try {
      showProgressIndicator();
      final response = await NetworkCaller().getRequest(AppUrls.getUserProfile,
          token: "Bearer ${AuthService.token}");

      if (response.isSuccess && response.statusCode == 200) {
        //userProfile.refresh();
        userProfile.value = GetUser.fromJson(response.responseData);
        log("user profile called");

        log(profile.data!.name.toString());
        print(
            "The skill list is: ${userProfile.value.data?.skills?.toString()}");
        skillList.value = userProfile.value.data?.skills?.cast<String>() ?? [];
        toolsList.value = userProfile.value.data?.tools?.cast<String>() ?? [];
        interestList.value =
            userProfile.value.data?.interests?.cast<String>() ?? [];
        languageList.value =
            userProfile.value.data?.languages?.cast<String>() ?? [];
        //  profilePath.value = userProfile.value.data?.image ?? '';
      } else if (response.statusCode == 404) {
        AppSnackBar.showError('Data Not Found');
      }
    } catch (e) {
      print('Something went wrong $e');
      AppSnackBar.showError('Data Not Found $e');
    } finally {
      hideProgressIndicator();
      isLoading.value = false;
    }
  }

  //! Experience Part ======================

  final titleTEController = TextEditingController();
  final companyNameTEController = TextEditingController();
  final describeTEController = TextEditingController();
  final startExperienceTEController = TextEditingController();
  final endExperienceTEController = TextEditingController();

  Future<void> experienceAdd() async {
    final title = titleTEController.text.trim();
    final company = companyNameTEController.text.trim();
    final startDate = startExperienceTEController.text.trim();
    final endDate = endExperienceTEController.text.trim();
    final desc = describeTEController.text.trim();

    if (title.isEmpty ||
        company.isEmpty ||
        startDate.isEmpty ||
        endDate.isEmpty) {
      AppSnackBar.showError('Please fill all required fields');
      return;
    }

    if (startDate.length != 4 || endDate.length != 4) {
      AppSnackBar.showError('Enter valid year (e.g., 2023)');
      return;
    }

    final requestBody = {
      'title': title,
      'company': company,
      'startDate': startDate,
      'endDate': endDate,
      'description': desc
    };

    try {
      showProgressIndicator();
      final response = await NetworkCaller().postRequest(
        AppUrls.createExperience,
        body: requestBody,
        token: "Bearer ${AuthService.token}",
      );

      if (response.isSuccess && response.statusCode == 201) {
        AppSnackBar.showSuccess('Create experience successfully');
        await getProfile();
        titleTEController.clear();
        companyNameTEController.clear();
        startExperienceTEController.clear();
        endExperienceTEController.clear();
        describeTEController.clear();
      } else {
        AppSnackBar.showError(
            'Failed to add experience');
      }
    } catch (e) {
      String errorMsg = e.toString().contains('SocketException')
          ? 'No internet connection'
          : 'Something went wrong: $e';
      AppSnackBar.showError(errorMsg);
    } finally {
      hideProgressIndicator();
    }
  }

  Future<void> deleteExperience(String id) async {
    try {
      showProgressIndicator();
      final response = await NetworkCaller().deleteRequest(
          "${AppUrls.experienceDelete}/$id", "Bearer ${AuthService.token}");

      if (response.isSuccess) {
        AppSnackBar.showSuccess("Experience deleted successfully!");
        await getProfile();
      } else {
        AppSnackBar.showError("Failed to delete");
      }
    } catch (e) {
      AppSnackBar.showError("Error: ${e.toString()}");
    } finally {
      hideProgressIndicator();
    }
  }

  //! Educaton Part ================

  final instituteNameTEController = TextEditingController();
  final majorSubjectTEController = TextEditingController();
  final minorSubjectTEController = TextEditingController();
  final degreeTEController = TextEditingController();
  final startTEController = TextEditingController();
  final endTEController = TextEditingController();

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
      showProgressIndicator();
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
    } finally {
      hideProgressIndicator();
    }
  }

  Future<void> deleteEducation(String id) async {
    try {
      showProgressIndicator();
      final response = await NetworkCaller().deleteRequest(
          "${AppUrls.educationDelete}/$id", "Bearer ${AuthService.token}");

      if (response.isSuccess) {
        AppSnackBar.showSuccess("Education deleted successfully!");
        await getProfile();
      } else {
        AppSnackBar.showError("Failed to delete");
      }
    } catch (e) {
      AppSnackBar.showError("Error: ${e.toString()}");
    } finally {
      hideProgressIndicator();
    }
  }

  void refresh() {
    update();
  }

  GetUser get profile => userProfile.value;
}
