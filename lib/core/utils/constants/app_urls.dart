class AppUrls {
  AppUrls._();

  static const String _baseUrl = 'http://10.0.20.12:6042/api/v1';

  // VPS Server ===========================
 // static const String _baseUrl = 'http://10.0.20.12:6042/api/v1';

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
  // static String removeFavoriteById(id) => '$_baseUrl/favorite/delete/id';

  // Sifat ===================================
  static const String createPost = '$_baseUrl/post/create';
  static const String getAllPost = '$_baseUrl/post/all';
  static const String getSinglePost = '$_baseUrl/post';

  static const String singleUserPost = '$_baseUrl/post/user';

  static const String editPost = '$_baseUrl/post/update';
  static const String deletePost = '$_baseUrl/post/delete';

  static const String jobApplie = '$_baseUrl/application/create';
  static const String getUserProfile = '$_baseUrl/user/profile';


  static const String like = '$_baseUrl/like';



  //experience ---------
  static const String createExperience = '$_baseUrl/experience/create';
  static String experienceDelete(id) => '$_baseUrl/experience/delete/id';
  static const String experienceUpdate = '$_baseUrl/experience/update/';
  
  //Education ---------
  static const String createEducation = '$_baseUrl/education/create';
  static  String educationDelete(id) => '$_baseUrl/education/delete/id';
  static const String educationUpdate = '$_baseUrl//education/update/';

  

  // Added by Shahriar
  static const String appliedItem = '$_baseUrl/application/getAppliedJob';
  static const String getProfileViewJob = '$_baseUrl/application/getProfileViewedJob';
  static const String getShortlistedJob = '$_baseUrl/application/getShortlistedJob';
  static const String getInterViewJob = '$_baseUrl/application/getInterviewJob';

  static const String addFavorite = '$_baseUrl/favorite/add';
  static const String removeFavorite = '$_baseUrl/favorite/delete';

  static const String changePassword = '$_baseUrl/user/change-password';
  static const String profileUpdate = '$_baseUrl/user/update';
}

