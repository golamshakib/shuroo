import 'dart:developer' show log;

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/features/post_creation_repost_delete/data/get_post_data_model.dart';

import '../../../core/utils/constants/image_path.dart';

class HomeController extends GetxController {
  final commentTEController = TextEditingController().obs;
  var replyOf = ''.obs;
  var addComment = true.obs;
  var commentHint = "Add a comment...".obs;
  final FocusNode controllerNode = FocusNode();

  RxBool activeNotification = true.obs;

  final List<String> item = [
    ImagePath.photo_home,
    ImagePath.photo_home,
    ImagePath.photo_home,
    ImagePath.photo_home,
  ];

  RxList<Map<String, dynamic>> commentList = [
    {
      'id': '0',
      'image': IconPath.icon_pro,
      'name': "Johan Ronsse",
      'designation': "Designer & Educator",
      "time": "2d",
      "comment": "Why are these not visible for viewers?",
      "like": 1,
      'reply': 1,
      'replies': [
        {
          'image': IconPath.icon_pro,
          'name': "Johan Ronsse",
          'designation': "Designer & Educator",
          "time": "2d",
          "comment": "Why are these not visible for viewers?",
          "like": 1,
          'reply': ""
        },
      ].obs
    },
    {
      'id': '1',
      'image': IconPath.icon_pro,
      'name': "Johan Ronsse",
      'designation': "Designer & Educator",
      "time": "2d",
      "comment": "Why are these not visible for viewers?",
      "like": 1,
      'reply': 1,
      'replies': [
        {
          'image': IconPath.icon_pro,
          'name': "Johan Ronsse",
          'designation': "Designer & Educator",
          "time": "2d",
          "comment": "Why are these not visible for viewers?",
          "like": 1,
          'reply': ""
        },
      ].obs
    }
  ].obs;

  void addCommentFunction(String comment) {
    final addBody = {
      'id': commentList.length.toString(),
      'image': IconPath.icon_pro,
      'name': "Johan Ronsse",
      'designation': "Designer & Educator",
      "time": "2d",
      "comment": comment,
      "like": 1,
      'reply': 1,
      'replies': [].obs
    };
    commentList.add(addBody);
    commentTEController.value.text = "";
    addComment.value = true;
  }

  void addReplyFunction(String comment) {
    final addBody = {
      'image': IconPath.icon_pro,
      'name': "Johan Ronsse",
      'designation': "Designer & Educator",
      "time": "2d",
      "comment": comment,
      "like": 1,
      'reply': 1,
    };
    commentList.value[int.parse(replyOf.value)]["replies"].add(addBody);
    commentTEController.value.text = "";
    addComment.value = true;
  }

  RxList<Datum> postDataList = <Datum>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllPost();
  }

  Future<void> getAllPost() async {
    try {
      final response = await NetworkCaller()
          .getRequest(AppUrls.getAllPost, token: "Bearer ${AuthService.token}");

      log("Raw response: ${response.responseData}");

      if (response.isSuccess && response.statusCode == 200) {
        final json = response.responseData;
        final userInformation = UserInformation.fromJson(json);
        refresh();
        postDataList.value = userInformation.data;
        //log("userInformation $userInformation");
        //AppSnackBar.showSuccess('All posts fetched successfully');
      } else if (response.statusCode == 404) {
      } else {
        AppSnackBar.showError('Something went wrong');
      }
    } catch (e, stackTrace) {
      log('Error fetching posts: $e\nStackTrace: $stackTrace');
      AppSnackBar.showError('Failed to fetch posts.');
    }
  }
}
