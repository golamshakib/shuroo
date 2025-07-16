
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:shuroo/features/profile/controller/personal_creation_controller.dart';

import '../../../core/common/widgets/app_snackbar.dart';
import '../../../core/common/widgets/progress_indicator.dart';
import '../../../core/services/Auth_service.dart';
import '../../../core/services/network_caller.dart';
import '../../../core/utils/constants/app_urls.dart';
import '../data/get_single_user_data_model.dart';
import '../data/single_post_data_model.dart';

class EditPostController extends GetxController{

  var isLoading = false.obs;
  var postId = "".obs;
  final captionController = TextEditingController();
  var picUploads = <String>[].obs;

  RxBool isPostButtonEnabled = true.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   captionController.addListener(_validatePost);
  //   ever(picUploads, (_) => _validatePost());
  // }

  void _validatePost() {
    final hasText = captionController.text.trim().isNotEmpty;
    final hasImage = picUploads.isNotEmpty;
    isPostButtonEnabled.value = hasText || hasImage;
  }

  /// Pick multiple images and update picUploads
  Future<void> pickImages() async {
    try {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final imagePath = image.path;
        picUploads.add(imagePath);
      }
    } catch (e) {
      log('Image picking error: $e');
      AppSnackBar.showError("Failed to pick images.");
    }
  }

  late PersonalCreationController controllerOne;
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    if(Get.arguments != null){
      isLoading.value = true;
      postId.value = Get.arguments;
      controllerOne = Get.find<PersonalCreationController>();
      await getSinglePost(Get.arguments);
      log("===================================================================");
      log(singlePost.value.data!.data!.content.toString());
      captionController.text = singlePost.value.data!.data!.content.toString();
      if(singlePost.value.data!.data!.image!.isNotEmpty){
        log("I am here");
        singlePost.value.data!.data!.image!.map((image) => picUploads.add(image)).toList();
      }
      else{
        log("I am here else");
      }
      isLoading.value = false;
    }
  }

  final singlePost = SinglePostDataModel().obs;

  Future<void> getSinglePost(String id) async {
    try {
      //  showProgressIndicator();
      final response =
      await NetworkCaller().getRequest("${AppUrls.getSinglePost}/$id");

      if (response.isSuccess && response.statusCode == 200) {
        final data = response.responseData;
        singlePost.value = SinglePostDataModel.fromJson(data);
      } else if (response.statusCode == 404) {
        AppSnackBar.showError('Data Not Found');
      } else {
        AppSnackBar.showError('Something Went Wrong');
      }
    } catch (e) {
      log('Something went Wrong $e');
    } finally {
      //  hideProgressIndicator();
    }
  }

  void updatePost() async{

    final requestBody = {
      "content": captionController.text
    };

    await requestToEditPost(requestBody, picUploads);
  }
  Future<void> requestToEditPost(Map<String, dynamic> requestBody, List<String> photoList) async{

    try{
      log("-----------------I am here in post now repo----------------------");
      var request = http.MultipartRequest("PUT", Uri.parse(AppUrls.editPostById(postId)));

      request.headers.addAll({'Authorization': "Bearer ${AuthService.token}"});

      request.fields['bodyData'] = jsonEncode(requestBody);

      for (int i = 0; i < photoList.length; i++) {
        final path = photoList[i];

        if (path.isNotEmpty) {
          final mimeType = lookupMimeType(path) ?? "image/jpeg";
          final splitMime = mimeType.split('/');

          final file = await http.MultipartFile.fromPath(
            "serviceVideo", // same field name for each image
            path,
            contentType: MediaType(splitMime[0], splitMime[1]),
          );

          request.files.add(file);
        }
      }
      log("-----------------I am here in post now repo 2----------------------");
      await showProgressIndicator();
      final response = await request.send();
      log(response.statusCode.toString());
      log("-----------------I am here in post now after request----------------------");
      if(response.statusCode == 200 || response.statusCode == 201){
        log("It is working");
        Get.back();
        Get.back();
        AppSnackBar.showSuccess("Service successfully added!!");
      }
      else if(response.statusCode == 417){
        Get.back();
        AppSnackBar.showError("Check your email to complete onboarding");
      }
      else{
        Get.back();
        AppSnackBar.showError("Something went wrong please try again!!");
      }

    }catch(e){
      log("-----------------I am here in post now catch----------------------");
      AppSnackBar.showError(e.toString());
    }
  }
}