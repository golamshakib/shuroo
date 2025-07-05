import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/common/widgets/progress_indicator.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';

class MakePostController extends GetxController {
  final textController = TextEditingController();
  var picUploads = <String>[].obs;

  RxBool isPostButtonEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    textController.addListener(_validatePost);
    ever(picUploads, (_) => _validatePost());
  }

  void _validatePost() {
    final hasText = textController.text.trim().isNotEmpty;
    final hasImage = picUploads.isNotEmpty;
    isPostButtonEnabled.value = hasText || hasImage;
  }

  /// Pick multiple images and update picUploads
  Future<void> pickImages() async {
    try {
      final picker = ImagePicker();
      final images = await picker.pickMultiImage();
      if (images != null && images.isNotEmpty) {
        picUploads.value = images.map((e) => e.path).toList();
      }
    } catch (e) {
      log('Image picking error: $e');
      AppSnackBar.showError("Failed to pick images.");
    }
  }

  /// Main method to create a post
  Future<void> createPost({required String postText}) async {
    final Map<String, dynamic> requestBody = {"content": postText};
    debugPrint("Request Body: $requestBody");

    try {
      showProgressIndicator();

      await _sendPostRequestWithOptionalImages(
        url: AppUrls.createPost,
        body: requestBody,
        imagePaths: picUploads,
      );
    } catch (e) {
      log('Error creating post: $e');
      AppSnackBar.showError("Failed to create post. Please try again.");
    } finally {
      hideProgressIndicator();
    }
  }

  //Post Repost ============================

  Future<bool> postRepost(String postId) async {
    try {
      final response = await NetworkCaller().postRequest(
          "${AppUrls.repostPost}/$postId",
          body: {'content': textController.text.toString()},
          token: "Bearer ${AuthService.token}");

      if (response.isSuccess) {
        log("Changed");
        textController.clear();
        return true;
      } else {
        log(response.statusCode.toString());
        return false;
      }
    } catch (e) {
      AppSnackBar.showError("Something went wrong!!");
      return false;
    }
  }

  /// Internal helper for sending multipart request with multiple images
  Future<void> _sendPostRequestWithOptionalImages({
    required String url,
    required Map<String, dynamic> body,
    required List<String> imagePaths,
  }) async {
    try {
      final accessToken = AuthService.token;

      if (accessToken == null || accessToken.isEmpty) {
        AppSnackBar.showError(
            "Unauthorized: Missing token. Please log in again.");
        return;
      }

      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['bodyData'] = jsonEncode(body);
      request.headers['Authorization'] = 'Bearer $accessToken';
      request.headers['Accept'] = 'application/json';

      for (final path in imagePaths) {
        try {
          log('Attaching image: $path');
          request.files
              .add(await http.MultipartFile.fromPath('postImage', path));
        } catch (e) {
          log('Failed to attach image $path: $e');
          AppSnackBar.showError("Failed to attach image: $path");
        }
      }

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      debugPrint("Status Code: ${response.statusCode}");
      debugPrint("Response Body: $responseBody");

      Map<String, dynamic>? responseData;
      try {
        responseData = jsonDecode(responseBody);
      } catch (e) {
        log('Response JSON decode error: $e');
        AppSnackBar.showError("Unexpected server response.");
        return;
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        final message = responseData?['message'] ?? 'Post created successfully';
        AppSnackBar.showSuccess(message);

        final postId = responseData?['data']?['id'];
        final imageUrls = responseData?['data']?['image'] != null
            ? List<String>.from(responseData!['data']['image'])
            : <String>[];
        log("Post created: $postId");
        log("Image URLs: $imageUrls");

        textController.clear();
        picUploads.clear();
      } else {
        AppSnackBar.showError(responseData?['message'] ?? 'Post failed.');
      }
    } catch (e) {
      log('Request error: $e');
      AppSnackBar.showError("Failed to create post.");
    }
  }
}
