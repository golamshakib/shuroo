import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/features/favorites/data/model/get_favorite_model.dart';


class FavouriteController extends GetxController{

  // Added by Shahriar

  final isLoading = false.obs;
  var favoriteJobIds = <String>{}.obs;
  var favoriteInformation = GetFavoriteModel();

  @override
  void onInit() async{
    super.onInit();
    isLoading.value = true;
    requestToGetFavorite();
    isLoading.value = false;
  }

  void reFresh() async{
    isLoading.value = true;
    requestToGetFavorite();
    isLoading.value = false;
  }

  Future<void> favoriteRefresh() async {
    await requestToGetFavorite();
  }



 // Added by Shahriar
  Future<void> requestToGetFavorite() async {
    try {
      final response = await NetworkCaller().getRequest(
        AppUrls.getFavorite,
        token: "Bearer ${AuthService.token}",
      );

      if (response.isSuccess) {
        final data = response.responseData;
        favoriteInformation = GetFavoriteModel.fromJson(data);

        final ids = <String>{};
        for (var item in favoriteInformation.data ?? []) {
          if (item.job?.id != null) {
            ids.add(item.job!.id.toString());
          }
        }
        favoriteJobIds.value = ids;
        favoriteJobIds.refresh();
      } else if (response.statusCode == 404) {
        favoriteJobIds.clear();
        favoriteJobIds.refresh();
      } else {
        AppSnackBar.showError(response.statusCode.toString());
      }
    } catch (e) {
      AppSnackBar.showError(e.toString());
    }
  }


  // Added by Shahriar
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
        favoriteJobIds.add(id);
      } else {
        AppSnackBar.showError("Failed to add to favorite.");
      }
    } catch (e) {
      AppSnackBar.showError(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Added by Shahriar
  Future<void> removeFavorite(String id) async {
    isLoading.value = true;
    try {
      final response = await NetworkCaller().deleteRequest(
        "${AppUrls.removeFavorite}/$id",
        "Bearer ${AuthService.token}",
      );

      if (response.isSuccess) {
        String? jobIdToRemove;
        final dataList = favoriteInformation.data;

        if (dataList != null) {
          final targetItem = dataList.firstWhereOrNull((item) => item.id.toString() == id);
          jobIdToRemove = targetItem?.job?.id?.toString();

          dataList.removeWhere((item) => item.id.toString() == id);
        }

        if (jobIdToRemove != null) {
          favoriteJobIds.remove(jobIdToRemove);
          favoriteJobIds.refresh();
        }

        favoriteInformation = favoriteInformation;
        AppSnackBar.showSuccess("Favorite removed successfully!");
      }else if(response.statusCode == 500){

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