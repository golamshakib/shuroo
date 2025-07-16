import 'dart:developer';

import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/features/jobs/data/model/get_applied_job_model.dart';

class AppliedController extends GetxController {
  final isLoading = false.obs;
  final getAppliedJob = GetAppliedJobModel().obs;

  @override
  void onInit() {
    super.onInit();
    getAppliedItem();
  }

  // Added by Shahriar
  Future<void> getAppliedItem() async {
    isLoading.value = true;
    try {
      final response = await NetworkCaller().getRequest(AppUrls.appliedItem,
          token: "Bearer ${AuthService.token}");
      if (response.isSuccess && response.statusCode == 200) {
        final data = response.responseData;
        getAppliedJob.value = GetAppliedJobModel.fromJson(data);
      }
      else if(response.statusCode == 404){
        log(response.statusCode.toString());
      }
      else {
        AppSnackBar.showError('${response.statusCode.toString()}Something Went Wrong');
      }
    } catch (e) {
      AppSnackBar.showError(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
