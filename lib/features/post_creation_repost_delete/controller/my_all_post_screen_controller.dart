import 'dart:developer' show log;

import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/common/widgets/progress_indicator.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/features/post_creation_repost_delete/data/get_my_post_date_model.dart';

import '../../../core/utils/constants/icon_path.dart';

class MyAllPostScreenController extends GetxController {
  final peopleIcons = [
    IconPath.man_icons,
    IconPath.man2,
    IconPath.man3,
    IconPath.man_icons,
    IconPath.man2,
    IconPath.man3,
    IconPath.man_icons,
    IconPath.man2,
    IconPath.man3
  ];
  final peopleName = [
    'Alice khan',
    'Alice',
    'Bob',
    'Charlie',
    'Diana',
    'Eve',
    'Frank',
    'Grace',
    'Grace'
  ];

  

  RxList<Datum> getUserPostData = <Datum>[].obs;
  //! Get All Post ===================================================
  // Future<void> getAllPost() async {
  //   try {
  //     showProgressIndicator();
  //     final response = await NetworkCaller().getRequest(AppUrls.getAllPost);

  //     if (response.isSuccess && response.statusCode == 200) {
  //       AppSnackBar.showSuccess('All Post Fetch Successfully');
  //     } else if (response.statusCode == 404) {
  //       AppSnackBar.showError('Data Not Found');
  //     } else {
  //       AppSnackBar.showError('Something went Wrong');
  //     }
  //   } catch (e) {
  //     log('Something went Wrong $e');
  //   } finally {
  //     hideProgressIndicator();
  //   }
  // }

  //! Get Single Post ===================================================

  Future<void> getSinglePost(String id) async {
    try {
      showProgressIndicator();
      final response =
          await NetworkCaller().getRequest("${AppUrls.getSinglePost}/$id");

      if (response.isSuccess && response.statusCode == 200) {
        AppSnackBar.showSuccess('Post Fetch Successfully');
      } else if (response.statusCode == 404) {
        AppSnackBar.showError('Data Not Found');
      } else {
        AppSnackBar.showError('Something Went Wrong');
      }
    } catch (e) {
      log('Something went Wrong $e');
    } finally {
      hideProgressIndicator();
    }
  }

  //! Get My Post Post ===================================================

  Future<void> getSingleUserPost(String userId) async {
    try {
      final response = await NetworkCaller().getRequest(
          "${AppUrls.singleUserPost}/$userId",
          token: AuthService.token);

      if (response.isSuccess && response.statusCode == 200) {
        final json = response.responseData;

        final userInformation = GetUserPost.fromJson(json);

        getUserPostData.value = userInformation.data.data;

        AppSnackBar.showSuccess('All posts fetched successfully');
      } else if (response.statusCode == 404) {
        AppSnackBar.showError('Data not found');
      } else {
        AppSnackBar.showError('Something went wrong');
      }
    } catch (e) {
      log('Something went wrong: $e');
      AppSnackBar.showError('Failed to fetch posts.');
    } finally {}
  }

  //! Delete Post ===================================================

  Future<void> deletePost(String id) async {
    try {
      showProgressIndicator();
      final response = await NetworkCaller().deleteRequest(
          "${AppUrls.deletePost}/$id", "Bearer ${AuthService.token}");

      if (response.isSuccess && response.statusCode == 200) {
        AppSnackBar.showSuccess("Delete Post Successfull");
      } else if (response.statusCode == 404) {
        AppSnackBar.showError("Post Not Found");
      } else {
        AppSnackBar.showError("Something Went Wrong");
      }
    } catch (e) {
      log('Something went Wrong $e');
    } finally {
      hideProgressIndicator();
    }
  }

  //! Edit Post ===================================================

  Future<void> updatePost(String id) async {
    try {
      showProgressIndicator();
      final response =
          await NetworkCaller().putRequest("${AppUrls.editPost}/$id");

      if (response.isSuccess && response.statusCode == 201) {
        AppSnackBar.showSuccess("Post Edit Successfully");
      } else if (response.statusCode == 404) {
        AppSnackBar.showError("Post Not Found");
      } else {
        AppSnackBar.showError("Something Went Wrong");
      }
    } catch (e) {
      log('Something went Wrong $e');
    } finally {
      hideProgressIndicator();
    }
  }
}
