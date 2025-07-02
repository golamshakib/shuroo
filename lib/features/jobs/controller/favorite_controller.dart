import 'package:get/get.dart';
import '../../../core/common/widgets/app_snackbar.dart';
import '../../../core/services/Auth_service.dart';
import '../../../core/services/network_caller.dart';
import '../../../core/utils/constants/app_urls.dart';

class FavoriteController extends GetxController{

  // final isLoading = false.obs;
  // // Added favorite by Shahriar
  // var isFavorite = false.obs;
  // Future<void> addFavorite(String id) async {
  //   isLoading.value = true;
  //   try {
  //     final response = await NetworkCaller().postRequest(
  //       "${AppUrls.addFavorite}/$id",
  //       body: {},
  //       token: "Bearer ${AuthService.token}",
  //     );
  //     print('Favorite Added id is : ${id}');
  //     if (response.isSuccess) {
  //       AppSnackBar.showSuccess("Favorite added successfully!");
  //       isFavorite.value = true;
  //     } else if(response.statusCode == 400){
  //       AppSnackBar.showSuccess('Favorite already exists');
  //     }
  //     else {
  //       AppSnackBar.showError("Failed to add to favorite.");
  //     }
  //   } catch (e) {
  //     AppSnackBar.showError(e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
  //
  // // Added by Shahriar
  // Future<void> removeFavorite(String id) async {
  //   isLoading.value = true;
  //   try {
  //     final response = await NetworkCaller().deleteRequest(
  //         "${AppUrls.removeFavorite}/$id",
  //         "Bearer ${AuthService.token}"
  //     );
  //     print("Token: ${AuthService.token}");
  //     print("ID: ${id}");
  //     print("REMOVE Favorite URL: ${AppUrls.removeFavorite}/$id");
  //
  //     if (response.isSuccess) {
  //       AppSnackBar.showSuccess("Favorite removed successfully!");
  //       isFavorite.value = false;
  //       print("Response Body: ${response.statusCode}");
  //     }
  //     else {
  //       AppSnackBar.showError("Failed to remove favorite.");
  //     }
  //   } catch (e) {
  //     AppSnackBar.showError(e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }


}