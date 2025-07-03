import 'dart:developer';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/routes/app_routes.dart';
import '../data/model/get_single_job_model.dart';

class JobDetailsController extends GetxController {

  // Added by Shahriar
  final isLoading = false.obs;
  final getSingleJobModel = GetSingleJobModel().obs;
  var jobId = "".obs;

  @override
  void onInit() async {
    super.onInit();
    if(Get.arguments != null){
      jobId.value = Get.arguments;
      print("Received jobId: $jobId");
      await fetchSingleJob(jobId.value);
    }
  }

  // Added by Shahriar
  Future<void> jobApplication(String id) async {
    isLoading.value = true;
    try {
      final response = await NetworkCaller().postRequest(
          "${AppUrls.jobApplie}/$id",
          body: {},
          token: "Bearer ${AuthService.token}");

      if (response.isSuccess && response.statusCode == 201) {
        AppSnackBar.showSuccess('Application successfully');
        Get.toNamed(AppRoute.appliedJobScreen)?.then((_) {
          Get.offAllNamed(AppRoute.nevBar);
        });
      }
      else if (response.statusCode == 400) {
        AppSnackBar.showSuccess('You have already applied for this job');
      } else {
       // AppSnackBar.showError('Something Went Wrong');
      }
    } catch (e) {
      print('Something Went Wrong $e');
    //  AppSnackBar.showError('Something Went Wrong');
    }finally{
      isLoading.value = false;
    }
  }


  // Get Single job added by Shahriar
  Future<void> fetchSingleJob(String id) async{
    isLoading.value = true;
    try{
      final response = await NetworkCaller().getRequest(
          AppUrls.getSingleJob(id),
          token: "Bearer ${AuthService.token}",
      );
      log("I am heerererer");
      if(response.isSuccess){
        final data = response.responseData;
        getSingleJobModel.value = GetSingleJobModel.fromJson(data);
      }
      else{
     //   AppSnackBar.showError('Something went wrong to fetch all Details!! ${response.statusCode}');
      }
    }catch(e){
   //   AppSnackBar.showError(e.toString());
    }finally{
      isLoading.value = false;
    }
  }

}

