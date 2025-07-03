

import 'dart:developer';

import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';

class HomeRepositories{


  Future<bool> changeLikeStatus(String postId) async{

    try{
      final response = await NetworkCaller().postRequest(AppUrls.likeById(postId), body: {}, token: "Bearer ${AuthService.token}");

      if(response.isSuccess){
        log("Changed");
        return true;
      }
      else{
        log(response.statusCode.toString());
        return false;
      }
    }catch(e){
      AppSnackBar.showError("Something went wrong!!");
      return false;
    }
  }
}