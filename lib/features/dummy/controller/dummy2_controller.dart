

import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/features/company_user%20_profile/data/others_user_information_data_model.dart';

import '../../../core/services/Auth_service.dart';
import '../../../core/services/network_caller.dart';
import '../../../core/utils/constants/app_urls.dart';

class Dummy2Controller extends GetxController{

  var isLoading = false.obs;

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();

    if(Get.arguments != null){
      isLoading.value = true;
      await getOthersProfile(Get.arguments['userId']);
      isLoading.value = false;
    }

  }

  var othersUserProfile = OtherUserInformation().obs;
  Future<void> getOthersProfile(String userId) async {
    try {
      final response = await NetworkCaller().getRequest(
        "${AppUrls.othersUserProfile}/$userId", token: "Bearer ${AuthService.token}",
      );

      if (response.isSuccess && response.statusCode == 200) {
        othersUserProfile.value = OtherUserInformation.fromJson(response.responseData);
      } else if (response.statusCode == 404) {
        AppSnackBar.showError("No data found!");
      } else {
        AppSnackBar.showError("Something went wrong please try again!!");
      }
    } catch (e) {
      print('Something went wrong $e');
    }
  }
}