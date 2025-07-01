import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/features/jobs/data/model/get_shortlisted_job_model.dart';

class ShortListedController extends GetxController{

  final isLoading = false.obs;
  final getShortlistJobModel = GetShortlistedJobModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchShortlist();
  }

  // Added by Shahriar
  Future<void> fetchShortlist() async{
    isLoading.value = true;
    try{
      print('Calling shortlist API...........................');
      final response = await NetworkCaller().getRequest(
        AppUrls.getShortlistedJob,
        token: "Bearer ${AuthService.token}"
      );
      if(response.isSuccess){
        final data = response.responseData;
        print(data);
        getShortlistJobModel.value = GetShortlistedJobModel.fromJson(data);
      }
      else if(response.statusCode == 404){

      }
      else{
        AppSnackBar.showError('Something Went Wrong');
      }
    }catch(e){
      AppSnackBar.showSuccess(e.toString());
    }finally{
      isLoading.value = false;
    }
  }
}