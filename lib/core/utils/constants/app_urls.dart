class AppUrls {
  AppUrls._();

  static const String _baseUrl = 'http://10.0.20.12:6042/api/v1';

  static const String signUp = '$_baseUrl/user/create';
  static const String login = '$_baseUrl/auth/login';
  static const String registerOTPAPI = '$_baseUrl/auth/verify-otp';
  static const String sendOTPToEmail = '$_baseUrl/auth/forget-password';
  static const String verifyOTP = '$_baseUrl/auth/forget-otp-verify';
  static const String resetPassword = '$_baseUrl/auth/reset-password';









  // Sifat ===================================
  static const String createPost = '$_baseUrl/post/create';
  static const String getAllPost = '$_baseUrl/post/all';
  static const String getSinglePost = '$_baseUrl/post';
  static const String editPost = '$_baseUrl/post/update';
  static const String deletePost = '$_baseUrl/post/delete';

}
