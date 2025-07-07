import 'dart:developer';
import 'dart:io';

import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SigninWithAppleService {
  static Future<AuthorizationCredentialAppleID?> signInWithApple() async {
    try {
      log("Starting Sign in with Apple");

      // Check if Sign in with Apple is available
      final bool isAvailable = await SignInWithApple.isAvailable();
      log("Sign in with Apple availability: $isAvailable");

      if (!isAvailable) {
        log("Sign in with Apple is not available on this device");
        throw Exception('Sign in with Apple is not available on this device');
      }

      // Check if we're on iOS 13+ or macOS 10.15+
      if (Platform.isIOS) {
        log("Running on iOS, proceeding with Apple Sign In");
      } else {
        log("Not running on iOS, Apple Sign In may not work properly");
      }

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      log("Apple Sign In successful: ${credential.userIdentifier}");
      print(credential);
      return credential;
    } on SignInWithAppleAuthorizationException catch (e) {
      log("Apple Sign In Authorization Exception: ${e.code} - ${e.message}");

      switch (e.code) {
        case AuthorizationErrorCode.canceled:
          log("User canceled the sign-in flow");
          break;
        case AuthorizationErrorCode.failed:
          log("Authorization failed");
          break;
        case AuthorizationErrorCode.invalidResponse:
          log("Invalid response from Apple");
          break;
        case AuthorizationErrorCode.notHandled:
          log("Authorization not handled");
          break;
        case AuthorizationErrorCode.notInteractive:
          log("Authorization not interactive");
          break;
        case AuthorizationErrorCode.unknown:
          log("Unknown authorization error - this might be a configuration issue");
          break;
        case AuthorizationErrorCode.credentialExport:
          log("Unknown authorization error - this might be a credentialExport issue");
          break;
        case AuthorizationErrorCode.credentialImport:
          log("Unknown authorization error - this might be a credentialImport issue");
          break;
        case AuthorizationErrorCode.matchedExcludedCredential:
          log("Unknown authorization error - this might be a matchedExcludedCredential issue");
          break;
      }

      rethrow;
    } catch (e) {
      log("General error during Apple Sign In: $e");
      rethrow;
    }
  }
}
