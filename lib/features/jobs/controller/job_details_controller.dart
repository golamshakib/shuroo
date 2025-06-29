import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/routes/app_routes.dart';

class JobDetailsController extends GetxController {
  Future<void> jobApplication(String id) async {
    try {
      final response = await NetworkCaller().postRequest(
          "${AppUrls.jobApplie}/$id",
          body: {},
          token: "Bearer ${AuthService.token}");

      if (response.isSuccess && response.statusCode == 201) {
        AppSnackBar.showSuccess('Application successfully');
        Get.offNamed(AppRoute.appliedJobScreen);
      } else if (response.statusCode == 404) {
        AppSnackBar.showError('You have already applied for this job');
      } else {
        AppSnackBar.showError('Something Went Wrong');
      }
    } catch (e) {
      print('Something Went Wrong $e');
      AppSnackBar.showError('Something Went Wrong');

      // log('Something Went Wrong');
    }
  }
}
