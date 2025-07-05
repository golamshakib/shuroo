import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/features/jobs/data/model/get_profile_view_job_model.dart';

class ProfileViewController extends GetxController{

  final isLoading = false.obs;
  final getProfileViewJobModel = GetProfileViewJobModel().obs;

  @override
  void onInit() async {
    fetchProfileViewJob();
    super.onInit();
  }

  Future<void> fetchProfileViewJob() async{
    isLoading.value = true;
    try{
      final response = await NetworkCaller().getRequest(
        AppUrls.getProfileViewJob,
        token: "Bearer ${AuthService.token}"
      );
      if(response.isSuccess){
        final data = response.responseData;
        getProfileViewJobModel.value = GetProfileViewJobModel.fromJson(data);
      }

    }catch(e){
      AppSnackBar.showError(e.toString());
    }finally{
      isLoading.value = false;
    }
  }
}