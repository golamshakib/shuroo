import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';




class GoogleSignInService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static GoogleSignIn? _googleSignIn;

  static Future<GoogleSignIn> _getGoogleSignIn() async {
    if (_googleSignIn == null) {
      try {
        // Read google-services.json to get Web Client ID
        final String response = await rootBundle.loadString('android/app/google-services.json');
        final data = json.decode(response);

        String? webClientId;
        for (var client in data['client']) {
          for (var oauthClient in client['oauth_client']) {
            if (oauthClient['client_type'] == 3) {
              webClientId = oauthClient['client_id'];
              break;
            }
          }
          if (webClientId != null) break;
        }

        log('Web Client ID found: $webClientId');

        _googleSignIn = GoogleSignIn(
          clientId: webClientId,
          scopes: ['email', 'profile'],
        );
      } catch (e) {
        log('Error reading google-services.json: $e');
        // Fallback to hardcoded client ID
        _googleSignIn = GoogleSignIn(
          clientId: '569226026728-qiqi5m1b1j5rh96uib7jnq75m3nde8tc.apps.googleusercontent.com',
          scopes: ['email', 'profile'],
        );
      }
    }
    return _googleSignIn!;
  }

  static Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = await _getGoogleSignIn();

      // Check if Google Play Services is available
      final bool isAvailable = await googleSignIn.isSignedIn();
      log('Google Sign-In availability check: $isAvailable');

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        log('User cancelled Google Sign-In');
        return null;
      }

      log('Google user signed in: ${googleUser.email}');

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Debug token information
      log('AccessToken: ${googleAuth.accessToken != null ? "Present" : "NULL"}');
      log('IdToken: ${googleAuth.idToken != null ? "Present" : "NULL"}');
      log('AccessToken length: ${googleAuth.accessToken?.length ?? 0}');
      log('IdToken length: ${googleAuth.idToken?.length ?? 0}');

      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        log('Failed to get Google authentication tokens');
        log('Trying to sign out and retry...');

        // Try signing out and retrying
        await googleSignIn.signOut();
        await Future.delayed(Duration(seconds: 1));

        final GoogleSignInAccount? retryUser = await googleSignIn.signIn();
        if (retryUser != null) {
          final GoogleSignInAuthentication retryAuth = await retryUser.authentication;
          log('Retry AccessToken: ${retryAuth.accessToken != null ? "Present" : "NULL"}');
          log('Retry IdToken: ${retryAuth.idToken != null ? "Present" : "NULL"}');

          if (retryAuth.accessToken == null || retryAuth.idToken == null) {
            return null;
          }

          final credential = GoogleAuthProvider.credential(
            accessToken: retryAuth.accessToken,
            idToken: retryAuth.idToken,
          );

          final userCredential = await _auth.signInWithCredential(credential);
          log('Firebase authentication successful: ${userCredential.user?.email}');
          return userCredential.user;
        }
        return null;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      log('Firebase authentication successful: ${userCredential.user?.email}');

      return userCredential.user;
    } on PlatformException catch (e) {
      log('Google Sign-In PlatformException: ${e.code} - ${e.message}');
      _handlePlatformException(e);
      return null;
    } on FirebaseAuthException catch (e) {
      log('Firebase Auth Exception: ${e.code} - ${e.message}');
      return null;
    } catch (e) {
      log('Google Sign-In unexpected error: $e');
      return null;
    }
  }

  static void _handlePlatformException(PlatformException e) {
    switch (e.code) {
      case 'sign_in_failed':
        if (e.message?.contains('10:') == true) {
          log('Error 10: Developer configuration error. Check SHA fingerprints and google-services.json');
        } else if (e.message?.contains('7:') == true) {
          log('Error 7: Network error. Check internet connection.');
        } else if (e.message?.contains('12500:') == true) {
          log('Error 12500: Sign-in cancelled by user.');
        } else if (e.message?.contains('12501:') == true) {
          log('Error 12501: Sign-in attempt cancelled.');
        }
        break;
      case 'network_error':
        log('Network error during sign-in');
        break;
      default:
        log('Unknown platform exception: ${e.code}');
    }
  }

  static Future<void> signOutFromGoogle() async {
    try {
      final GoogleSignIn googleSignIn = await _getGoogleSignIn();
      await googleSignIn.signOut();
      await _auth.signOut();
      log('Successfully signed out from Google');
    } catch (e) {
      log('Error signing out: $e');
    }
  }

  static User? getCurrentUser() {
    return _auth.currentUser;
  }
}

