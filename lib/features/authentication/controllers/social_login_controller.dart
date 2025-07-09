import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/goole_sign_in_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/core/utils/helpers/app_helper.dart';
import 'package:shuroo/core/utils/logging/logger.dart';
import 'package:shuroo/routes/app_routes.dart';

class SocialLoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isAppleLoading = false.obs;
  final NetworkCaller networkCaller = NetworkCaller();

  String fcmToken = "";

  @override
  @override
  void onInit() {
    super.onInit();
    initializeFCM(); // Remove async/await from here
  }

  Future<void> initializeFCM() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (Platform.isIOS) {
      String? apnsToken;
      int attempts = 0;
      const int maxAttempts = 10;

      do {
        apnsToken = await FirebaseMessaging.instance.getAPNSToken();
        await Future.delayed(const Duration(milliseconds: 300));
        attempts++;
      } while (apnsToken == null && attempts < maxAttempts);

      log("APNS Token: $apnsToken");
    }

    String? token = await FirebaseMessaging.instance.getToken();
    fcmToken = token ?? ""; // Store the token in the variable
    log("FCM Token: $fcmToken");
  }

  /// google sign in

  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;
      Get.dialog(
        Center(
          child: SpinKitCircle(
            color: AppColors.primary,
            size: 50.sp,
          ),
        ),
        barrierDismissible: false,
      );

      final gUser = await GoogleSignInService.signInWithGoogle();
      log("the profile picture is ${gUser!.photoURL.toString()}");

      log("Authentication successful - email: ${gUser.email}, name: ${gUser.displayName}");

      final Map<String, dynamic> requestBody = {
        "email": gUser.email,
        "name": gUser.displayName,
        'fcmToken': fcmToken,
        "role": "USER",
      };

      final response = await networkCaller.postRequest(AppUrls.socialLogin,
          body: requestBody);

      if (response.statusCode == 200 && response.isSuccess) {
        log("API response: ${response.responseData}");
        final String accessToken =
            response.responseData['data']['accessToken'] ?? '';

        if (accessToken.isNotEmpty) {
          await AuthService.saveToken(accessToken);
          Get.offAllNamed(AppRoute.nevBar);
        } else {
          log("No access token received from API");
          Get.back(); // Close loading dialog
          // Show error message to user
        }
      } else {
        log("API call failed: ${response.statusCode}");
        Get.back(); // Close loading dialog
        // Show error message to user
      }
    } catch (e) {
      log("Exception in signInWithGoogle: ${e.toString()}");
      Get.back();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signInWithApple(
      {String? fullName, required String identifyToken}) async {
    try {
      isAppleLoading.value = true;
      Get.dialog(
        Center(
          child: SpinKitCircle(
            color: AppColors.primary,
            size: 50.sp,
          ),
        ),
        barrierDismissible: false,
      );
      final response = await NetworkCaller().postRequest(AppUrls.appleSignIn,
          body: {
            "token": identifyToken,
            "name": fullName,
            "fcmToken": fcmToken
          });
      isLoading.value = false;
      Get.back();
      if (response.isSuccess) {
        log("API response: ${response.responseData}");
        final String accessToken =
            response.responseData['data']['accessToken'] ?? '';

        if (accessToken.isNotEmpty) {
          await AuthService.saveToken(accessToken);
          Get.offAllNamed(AppRoute.nevBar);
        }
      } else {
        AppHelperFunctions.showSnackBar(
          response.errorMessage,
        );
      }
    } catch (error) {
      Get.back();
      isLoading.value = false;
      AppLoggerHelper.error(error.toString());
    }
  }
}
