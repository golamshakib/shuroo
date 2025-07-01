import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/features/jobs/data/model/get_interview_job_model.dart';

class InterviewController extends GetxController{

  final isLoading = false.obs;
  final getInterViewJobModel = GetInterViewJobModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchInterView();
  }

  // Added by Shahriar
  Future<void> fetchInterView() async{
    isLoading.value = true;
    try{
      print('Calling shortlist API...........................');
      final response = await NetworkCaller().getRequest(
          AppUrls.getInterViewJob,
          token: "Bearer ${AuthService.token}"
      );
      if(response.isSuccess){
        final data = response.responseData;
        print(data);
        getInterViewJobModel.value = GetInterViewJobModel.fromJson(data);
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