import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/app_routes.dart';

class AuthService {
  static const String _tokenKey = 'token';

  static late SharedPreferences _preferences;

  static String? _token;

  // Initialize SharedPreferences (call this during app startup)
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    // Load token and userId from SharedPreferences into private variables
    _token = _preferences.getString(_tokenKey);
  }

  // Check if a token exists in local storage
  static bool hasToken() {
    return _preferences.containsKey(_tokenKey);
  }

  // Save the token and user ID to local storage
  static Future<void> saveToken(String token, {String? id}) async {
    try {
      await _preferences.setString(_tokenKey, token);
      // Update private variables
      _token = token;
    } catch (e) {
      log('Error saving token: $e');
    }
  }
static bool _isInitialized = false;



static Future<void> logoutUser() async {
  try {
    log('Logout called, _isInitialized: $_isInitialized');
    if (!_isInitialized) {
      log('Initializing SharedPreferences in logoutUser');
      _preferences = await SharedPreferences.getInstance();
      _isInitialized = true;
    }
    await _preferences.clear();
    _token = null;
    log('Logout cleared preferences');
    Get.offAllNamed(AppRoute.signInScreen);
  } catch (e) {
    log('Error during logout: $e');
  }
}




static Future<void> goToLogin() async {
  Get.offAllNamed(AppRoute.signInScreen);
}


  // Getter for token
  static String? get token => _token;
}
