class AppUrls {
  AppUrls._();

  static const String _baseUrl = 'http://10.0.20.12:6042/api/v1';

  static const String signUp = '$_baseUrl/user/create';
  static const String login = '$_baseUrl/auth/login';
  static const String registerOTPAPI = '$_baseUrl/auth/verify-otp';








  // Sifat ===================================
  static const String createPost = '$_baseUrl/post/create';

}
