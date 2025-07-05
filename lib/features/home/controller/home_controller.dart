import 'dart:developer' show log;

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/common/widgets/progress_indicator.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/features/home/data/get_post_comment_model.dart';
import 'package:shuroo/features/post_creation_repost_delete/data/get_post_data_model.dart';

import '../../../core/utils/constants/image_path.dart';
import '../../profile/controller/profile_information_controller.dart';

class HomeController extends GetxController {
  final commentTEController = TextEditingController().obs;
  var replyOf = ''.obs;
  var commentIDToReply = ''.obs;
  var addComment = true.obs;
  var commentHint = "Add a comment...".obs;
  final FocusNode controllerNode = FocusNode();

  final isLoading = false.obs;

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
    //commentList.value[int.parse(replyOf.value)]["replies"].add(addBody);
    commentTEController.value.text = "";
    addComment.value = true;
  }

  RxList<Datum> postDataList = <Datum>[].obs;
  late ProfileInformationController controllerOne;

  @override
  void onInit() {
    super.onInit();
    controllerOne = Get.find<ProfileInformationController>();
    getAllPost();
  }

  // Refresh Controller

  // Future<void> refreshPostList() async{
  //   await getAllPost();
  // }

  Future<void> refreshPostList() async {
    await getAllPost();
  }

  Future<void> getAllPost() async {
    try {
      final response = await NetworkCaller()
          .getRequest(AppUrls.getAllPost, token: "Bearer ${AuthService.token}");

    //  log("Raw response: ${response.responseData}");

      if (response.isSuccess && response.statusCode == 200) {
        final json = response.responseData;
        final userInformation = UserInformation.fromJson(json);
      postDataList.refresh();
      //  update();
        postDataList.value = userInformation.data!;
        //log("userInformation $userInformation");
        //AppSnackBar.showSuccess('All posts fetched successfully');
      } else if (response.statusCode == 404) {
      } else {
       // AppSnackBar.showError('Something went wrong');
      }
    } catch (e, stackTrace) {
      log('Error fetching posts: $e\nStackTrace: $stackTrace');
     // AppSnackBar.showError('Failed to fetch posts.');
    }
  }

  Future<bool> changeLikeStatus(String postId) async{

    try{
      final response = await NetworkCaller().postRequest(AppUrls.likeById(postId), body: {}, token: "Bearer ${AuthService.token}");

      if(response.isSuccess){
        log("Changed");
        return true;
      }
      else{
        log(response.statusCode.toString());
        AppSnackBar.showError("Something went wrong!!");
        return false;
      }
    }catch(e){
      AppSnackBar.showError("Something went wrong!!");
      return false;
    }
  }

  var getPostCommentInformation = GetPostCommentModel().obs;
  var loadComment = false.obs;
  Future<void> requestForPostComment(String postId) async{
    loadComment.value = true;
    try{
      final response = await NetworkCaller().getRequest(AppUrls.getCommentById(postId), token: "Bearer ${AuthService.token}");

      if(response.isSuccess){
        final data = response.responseData;
        getPostCommentInformation.value = GetPostCommentModel.fromJson(data);
        loadComment.value = false;
      }
      else if(response.statusCode == 404){
        log("No comments");
        loadComment.value = false;
      }
      else{
        log(response.statusCode.toString());
        loadComment.value = false;
      }
    }catch(e){
      AppSnackBar.showError(e.toString());
      loadComment.value = false;
    }
  }

  void requestToSubmitComment(String postId) async{
    final requestBody = {
      "comment": commentTEController.value.text
    };
    await submitComment(requestBody, postId);
  }

  Future<void> submitComment(Map<String, dynamic> requestBody, String postId) async{

    try{
      showProgressIndicator();
      final response = await NetworkCaller().postRequest(AppUrls.createCommentById(postId), body: requestBody,token: "Bearer ${AuthService.token}");

      if(response.isSuccess){
        Get.back();
        commentTEController.value.clear();
        requestForPostComment(postId);
        AppSnackBar.showSuccess("Comment Posted");
      }
      else{
        Get.back();
        AppSnackBar.showError(response.statusCode.toString());
      }
    }catch(e){
      Get.back();
      AppSnackBar.showError(e.toString());
    }
  }

  void requestToEditComment(String postId, String commentId) async{
    final requestBody = {
      "comment": commentTEController.value.text
    };
    await editComment(requestBody, postId, commentId);
  }

  Future<void> editComment(Map<String, dynamic> requestBody, String postId, String commentId) async{

    try{
      showProgressIndicator();
      final response = await NetworkCaller().putRequest(AppUrls.editCommentById(commentId), body: requestBody,token: "Bearer ${AuthService.token}");

      if(response.isSuccess){
        Get.back();
        Get.back();
        Get.back();
        commentTEController.value.clear();
        requestForPostComment(postId);
        AppSnackBar.showSuccess("Comment Edited");
      }
      else{
        Get.back();
        AppSnackBar.showError(response.statusCode.toString());
      }
    }catch(e){
      Get.back();
      AppSnackBar.showError(e.toString());
    }
  }

  Future<void> deletedComment(String postId, String commentId) async{
    try{
      showProgressIndicator();
      final response = await NetworkCaller().deleteRequest(AppUrls.deleteCommentById(commentId), "Bearer ${AuthService.token}");

      if(response.isSuccess){
        Get.back();
        Get.back();
        Get.back();
        requestForPostComment(postId);
        AppSnackBar.showSuccess("Comment deleted!");
      }
      else{
        Get.back();
        AppSnackBar.showError(response.statusCode.toString());
      }
    }catch(e){
      Get.back();
      AppSnackBar.showError(e.toString());
    }
  }

  /// Reply part

  void requestToSubmitReply(String commentID, String postId) async{
    final requestBody = {
      "replyComment": commentTEController.value.text
    };
    await submitReply(requestBody, commentID, postId);
  }

  Future<void> submitReply(Map<String, dynamic> requestBody, String commentId, String postId) async{

    try{
      showProgressIndicator();
      final response = await NetworkCaller().postRequest(AppUrls.createReplyById(commentId), body: requestBody,token: "Bearer ${AuthService.token}");

      if(response.isSuccess){
        Get.back();
        commentTEController.value.clear();
        requestForPostComment(postId);
        AppSnackBar.showSuccess("Reply Posted");
      }
      else{
        Get.back();
        AppSnackBar.showError(response.statusCode.toString());
      }
    }catch(e){
      Get.back();
      AppSnackBar.showError(e.toString());
    }
  }

  void requestToEditReply(String postId, String replyId) async{
    final requestBody = {
      "replyComment": commentTEController.value.text
    };
    await editReply(requestBody, postId, replyId);
  }

  Future<void> editReply(Map<String, dynamic> requestBody, String postId, String replyId) async{

    try{
      showProgressIndicator();
      final response = await NetworkCaller().putRequest(AppUrls.editReplyById(replyId), body: requestBody,token: "Bearer ${AuthService.token}");

      if(response.isSuccess){
        Get.back();
        Get.back();
        Get.back();
        commentTEController.value.clear();
        requestForPostComment(postId);
        AppSnackBar.showSuccess("Reply Edited");
      }
      else{
        Get.back();
        AppSnackBar.showError(response.statusCode.toString());
      }
    }catch(e){
      Get.back();
      AppSnackBar.showError(e.toString());
    }
  }

  Future<void> deletedReply(String postId, String replyId) async{
    try{
      showProgressIndicator();
      final response = await NetworkCaller().deleteRequest(AppUrls.deleteReplyById(replyId), "Bearer ${AuthService.token}");

      if(response.isSuccess){
        Get.back();
        Get.back();
        Get.back();
        requestForPostComment(postId);
        AppSnackBar.showSuccess("Comment deleted!");
      }
      else{
        Get.back();
        AppSnackBar.showError(response.statusCode.toString());
      }
    }catch(e){
      Get.back();
      AppSnackBar.showError(e.toString());
    }
  }

}
///