import 'dart:developer' show log;
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/common/widgets/progress_indicator.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/features/post_creation_repost_delete/data/get_single_user_data_model.dart';

import '../../../core/utils/constants/icon_path.dart';
import '../../profile/controller/profile_information_controller.dart';

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
  @override
  void onInit() async {
    super.onInit();

    final controllerOne = Get.find<ProfileInformationController>();
    log(controllerOne.userProfile.value.data!.id.toString());
    await getSingleUserPost(
        controllerOne.userProfile.value.data!.id.toString());
  }

  Future<void> refreshMyPost() async {
    final controllerOne = Get.find<ProfileInformationController>();

    await getSingleUserPost(
        controllerOne.userProfile.value.data!.id.toString());
  }

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

  var getUserPost = GetSingleUser().obs;

  Future<void> getSingleUserPost(String userId) async {
    try {
      final response = await NetworkCaller().getRequest(
          "${AppUrls.singleUserPost}/$userId",
          token: AuthService.token);

      if (response.isSuccess && response.statusCode == 200) {
        final json = response.responseData;

        getUserPost.value = GetSingleUser.fromJson(json);

        //  AppSnackBar.showSuccess('All posts fetched successfully');
      } else if (response.statusCode == 404) {
        AppSnackBar.showError('Data not found');
      } else {
        //  AppSnackBar.showError('Something went wrong');
      }
    } catch (e) {
      log('Something went wrong: $e');
      //  AppSnackBar.showError('Failed to fetch posts.');
    } finally {}
  }

  //! Delete Post ===================================================

  Future<void> deletePost(String id) async {
    try {
      //  showProgressIndicator();
      final response = await NetworkCaller().deleteRequest(
          "${AppUrls.deletePost}/$id", "Bearer ${AuthService.token}");

      if (response.isSuccess && response.statusCode == 200) {
        getUserPost.value.data?.data?.removeWhere((post) => post.id == id);
        getUserPost.refresh();
        AppSnackBar.showSuccess("Delete Post Successfull");
      } else if (response.statusCode == 404) {
        AppSnackBar.showError("Post Not Found");
      } else {
        AppSnackBar.showError("Something Went Wrong");
      }
    } catch (e) {
      log('Something went Wrong $e');
    } finally {
      // hideProgressIndicator();
    }
  }

  //! Edit Post ===================================================

  Future<void> updatePost(String id, Map<String, dynamic> updatedData) async {
    try {
      showProgressIndicator();

      final response = await NetworkCaller().putRequest(
        "${AppUrls.editPost}/$id",
        body: updatedData,
        token: "Bearer ${AuthService.token}",
      );

      if (response.isSuccess &&
          (response.statusCode == 200 || response.statusCode == 201)) {
        final updatedJson = response.responseData['data']['update'];

        final index =
            getUserPost.value.data?.data?.indexWhere((post) => post.id == id);

        if (index != null && index >= 0) {
          // Update the local list with new values
          final postList = getUserPost.value.data!.data!;
          final post = postList[index];

          post.content = updatedJson['content'];
          post.image = List<String>.from(updatedJson['image'] ?? []);
          post.updatedAt = DateTime.tryParse(updatedJson['updatedAt'] ?? "");

          getUserPost.refresh();
        }

        AppSnackBar.showSuccess("Post Edited Successfully");
      } else if (response.statusCode == 404) {
        AppSnackBar.showError("Post Not Found");
      } else {
        AppSnackBar.showError("Something Went Wrong");
      }
    } catch (e) {
      log('Something went Wrong $e');
      AppSnackBar.showError("Something went wrong");
    } finally {
      hideProgressIndicator();
    }
  }
}
