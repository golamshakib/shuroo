import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/services/auth_service.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';

class MakePostController extends GetxController {
  final textController = TextEditingController();
  var picUpload = "".obs;

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  void pickProfile() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      picUpload.value = image.path;
    }
  }

  Future<void> createPost({
    required BuildContext context,
    required String postText,
  }) async {
    final Map<String, dynamic> requestBody = {"content": postText};
    debugPrint("Request Body: $requestBody");

    try {
      await _sendPostRequestWithOptionalImage(
        url: AppUrls.createPost,
        body: requestBody,
        imagePath: picUpload.value,
        token: AuthService.token,
        context: context,
      );
    } catch (e) {
      log('Error creating post: $e');
      AppSnackBar.showError("Failed to create post. Please try again.");
    }
  }

  Future<void> _sendPostRequestWithOptionalImage({
    required String url,
    required Map<String, dynamic> body,
    required String? imagePath,
    required String? token,
    required BuildContext context,
  }) async {
    if (token == null || token.isEmpty) {
      AppSnackBar.showError('Token is invalid or expired.');
      return;
    }

    try {
      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});
      request.fields['bodyData'] = jsonEncode(body);

      if (imagePath != null && imagePath.isNotEmpty) {
        log('Attaching image: $imagePath');
        request.files.add(
          await http.MultipartFile.fromPath('postImage', imagePath),
        );
      }

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      final responseData = jsonDecode(responseBody);

      debugPrint("Status Code: ${response.statusCode}");
      debugPrint("Response Body: $responseBody");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final message = responseData['message'] ?? 'Post created successfully';
        AppSnackBar.showSuccess(message);

        // Optional logging of response data
        final postId = responseData['data']['id'];
        final imageUrls = List<String>.from(responseData['data']['image']);
        log("Post created: $postId");
        log("Image URLs: $imageUrls");

        // Clear inputs
        textController.clear();
        picUpload.value = '';
      } else {
        AppSnackBar.showError(responseData['message'] ?? 'Post failed.');
      }
    } catch (e) {
      log('Request error: $e');
      AppSnackBar.showError("Failed to create post.");
    }
  }
}
