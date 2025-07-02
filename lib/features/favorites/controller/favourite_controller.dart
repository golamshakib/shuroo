import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/features/favorites/data/model/get_favorite_model.dart';


class FavouriteController extends GetxController{


  final isLoading = false.obs;

  @override
  void onInit() async{
    super.onInit();
    isLoading.value = true;
    requestToGetFavorite();
    isLoading.value = false;
  }

  Future<void> favoriteRefresh() async {
    await requestToGetFavorite();
  }

  var favoriteInformation = GetFavoriteModel();

  Future<void> requestToGetFavorite() async{
    try{
      final response = await NetworkCaller().getRequest(AppUrls.getFavorite, token: "Bearer ${AuthService.token}");

      if(response.isSuccess){
        final data = response.responseData;
        favoriteInformation = GetFavoriteModel.fromJson(data);
      }else if(response.statusCode == 404){

      }
      else{
        AppSnackBar.showError(response.statusCode.toString());
      }
    }catch(e){
      AppSnackBar.showError(e.toString());
    }
  }

  void reFresh() async{
    isLoading.value = true;
    requestToGetFavorite();
    isLoading.value = false;
  }

  // Future<void> requestToDeleteFavorite(String id) async{
  //
  //   try{
  //     final response = await NetworkCaller().deleteRequest(AppUrls.removeFavoriteById(id), "Bearer ${AuthService.token}");
  //
  //     if(response.isSuccess){
  //       AppSnackBar.showError("Removed from favorite!");
  //       reFresh();
  //     }
  //     else{
  //       AppSnackBar.showError(response.statusCode.toString());
  //     }
  //   }catch(e){
  //     AppSnackBar.showError(e.toString());
  //   }
  // }





  // Added by Shahriar
  var favoriteJobIds = <String>{}.obs;

  Future<void> addFavorite(String id) async {
    isLoading.value = true;
    try {
      final response = await NetworkCaller().postRequest(
        "${AppUrls.addFavorite}/$id",
        body: {},
        token: "Bearer ${AuthService.token}",
      );
      if (response.isSuccess) {
        favoriteJobIds.add(id);
        requestToGetFavorite();
        favoriteJobIds.refresh();
        AppSnackBar.showSuccess("Favorite added successfully!");
      } else if (response.statusCode == 400) {
        AppSnackBar.showSuccess("Favorite already exists");
        favoriteJobIds.add(id); // Optional: trust API
      } else {
        AppSnackBar.showError("Failed to add to favorite.");
      }
    } catch (e) {
      AppSnackBar.showError(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> removeFavorite(String id) async {
    isLoading.value = true;
    try {
      final response = await NetworkCaller().deleteRequest(
        "${AppUrls.removeFavorite}/$id",
        "Bearer ${AuthService.token}",
      );
      print('Favorite Remove id : ${id}');
      if (response.isSuccess) {
        favoriteJobIds.remove(id);
        requestToGetFavorite();
        favoriteJobIds.refresh();
        AppSnackBar.showSuccess("Favorite removed successfully!");
      }else if(response.statusCode == 500) {

      }
      else {
        AppSnackBar.showError("Failed to remove favorite.");
      }
    } catch (e) {
      AppSnackBar.showError(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  bool isJobFavorite(String id) => favoriteJobIds.contains(id);
}