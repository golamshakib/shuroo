import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/features/jobs/data/model/get_single_job_model.dart';

class JobDetailsController extends GetxController{


  final isLoading = false.obs;
  final getSingleJobModel = GetSingleJobModel().obs;

  @override
  void onInit() async {
    final jobId = Get.arguments;
    if (jobId != null) {
      fetchSingleJob(jobId);
    }
    super.onInit();
  }

  // Get Single job added by Shahriar
  Future<void> fetchSingleJob(String id) async{
   isLoading.value = true;
   try{
     final response = await NetworkCaller().getRequest(
       AppUrls.getSingleJob(id),
       token: AuthService.token
     );
     if(response.isSuccess){
       final data = response.responseData;
       getSingleJobModel.value = GetSingleJobModel.fromJson(data);
     }
     else{
       AppSnackBar.showError(
         'Something went wrong to fetch all Details!! ${response.statusCode}',
       );
     }
   }catch(e){
     AppSnackBar.showError(e.toString());
   }finally{
     isLoading.value = false;
   }
  }
}