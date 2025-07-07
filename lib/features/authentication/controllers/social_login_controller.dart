
import 'package:get/get.dart';

class SocialLoginController extends GetxController{
  RxBool isLoading = false.obs;


  /// google sign in

}


/*
class SocialLoginController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> signInWithGoogle({String role = ""}) async {
    try {
      isLoading.value = true;
      Get.dialog(
        Center(
          child: SpinKitFadingCircle(color: AppColors.primary, size: 50.sp),
        ),
        barrierDismissible: false,
      );

      //Start google Sign in popup starts from here
      final gUser = await GoogleSignInService.signInWithGoogle();
      if (gUser != null) {
        log(
          "Authenticate with, email${gUser.email} , Name: ${gUser.displayName}",
        );

        //Api body
        final Map<String, dynamic> requestBody =
            role.isNotEmpty
                ? {
                  "username": gUser.displayName,
                  "email": gUser.email,
                  "role": role,
                  //TODO: replace with acctual fcm token
                  "fcmToken": "fdfwerewrtwertgregf",
                }
                : {
                  "username": gUser.displayName,
                  "email": gUser.email,

                  //TODO: replace with acctual fcm token
                  "fcmToken": "fdfwerewrtwertgregf",
                };

        // Making server request for login
        final response = await NetworkCaller().postRequest(
          AppUrls.socialLogin,
          body: requestBody,
        );
        if (response.isSuccess) {
          final String role = response.responseData["data"]["role"] ?? "";
          final String accessToken =
              response.responseData["data"]["accessToken"] ?? "";
          if (accessToken.isNotEmpty || role.isNotEmpty) {
            await AuthService.saveToken(accessToken);
            await AuthService.saveRole(role);

            Get.offAll(
              () => role == 'CONSUMER' ? ConsumerNavBar() : AdvisorNavBar(),
            );
          }
        } else {
          if (Get.isDialogOpen == true) Get.back();
          CustomSnackBar.showCustomErrorSnackBar(
            title: "Error",
            message: response.errorMessage,
          );
        }
      } else {
        isLoading.value = false;
        if (Get.isDialogOpen == true) Get.back();
        CustomSnackBar.showCustomErrorSnackBar(
          title: "Error",
          message: "Something went wrong please try again",
        );
      }
    } catch (error) {
      isLoading.value = false;
      log("Faild to login with google $error");
    } finally {
      isLoading.value = false;
      if (Get.isDialogOpen == true) Get.back();
    }
  }
}
 */