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
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    requestToGetFavorite();
    isLoading.value = false;
  }

  var favoriteInformation = GetFavoriteModel();

  Future<void> requestToGetFavorite() async{
    try{
      final response = await NetworkCaller().getRequest(AppUrls.getFavorite, token: "Bearer ${AuthService.token}");

      if(response.isSuccess){
        final data = response.responseData;
        favoriteInformation = GetFavoriteModel.fromJson(data);
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

  Future<void> requestToDeleteFavorite(String id) async{

    try{
      final response = await NetworkCaller().deleteRequest(AppUrls.removeFavoriteById(id), "Bearer ${AuthService.token}");

      if(response.isSuccess){
        AppSnackBar.showError("Removed from favorite!");
        reFresh();
      }
      else{
        AppSnackBar.showError(response.statusCode.toString());
      }
    }catch(e){
      AppSnackBar.showError(e.toString());
    }
  }
}