class AppUrls {
  AppUrls._();

  static const String _baseUrl = 'http://10.0.20.12:6042/api/v1';

  static const String signUp = '$_baseUrl/user/create';
  static const String login = '$_baseUrl/auth/login';
  static const String registerOTPAPI = '$_baseUrl/auth/verify-otp';
  static const String sendOTPToEmail = '$_baseUrl/auth/forget-password';
  static const String verifyOTP = '$_baseUrl/auth/forget-otp-verify';
  static const String resetPassword = '$_baseUrl/auth/reset-password';
  static const String getFavorite = '$_baseUrl/favorite/get';


  static String removeFavoriteById(id) => '$_baseUrl/favorite/delete/id';


  // Job Added by Shahriar
  static const String getAllJobs = '$_baseUrl/job/all';
  static String getSingleJob(id) => '$_baseUrl/job/$id';



  // Sifat ===================================
  static const String createPost = '$_baseUrl/post/create';
  static const String getAllPost = '$_baseUrl/post/all';
  static const String getSinglePost = '$_baseUrl/post';
  static const String editPost = '$_baseUrl/post/update';
  static const String deletePost = '$_baseUrl/post/delete';



  static const String jobApplie = '$_baseUrl/application/create';

  // Added by Shahriar
  static const String appliedItem = '$_baseUrl/application/getAppliedJob';
  static const String getProfileViewJob = '$_baseUrl/application/getProfileViewedJob';



  static const String changePassword = '$_baseUrl/user/change-password';
  static const String profileUpdate = '$_baseUrl/user/update';

}
