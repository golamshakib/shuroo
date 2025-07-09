class AppUrls {
  AppUrls._();

  static const String _baseUrl = 'http://10.0.20.12:6042/api/v1';
  static const String connectSocket = 'ws://31.97.145.131:6042';

  // VPS Server ===========================
 // static const String _baseUrl = 'http://31.97.145.131:6042/api/v1';

  static const String signUp = '$_baseUrl/user/create';
  static const String login = '$_baseUrl/auth/login';
  static const String registerOTPAPI = '$_baseUrl/auth/verify-otp';
  static const String sendOTPToEmail = '$_baseUrl/auth/forget-password';
  static const String verifyOTP = '$_baseUrl/auth/forget-otp-verify';
  static const String resetPassword = '$_baseUrl/auth/reset-password';
  static const String getFavorite = '$_baseUrl/favorite/get';

  static String removeFavoriteById(id) => '$_baseUrl/favorite/delete/id';
  static String likeById(id) => '$_baseUrl/like/$id';
  static String createCommentById(id) => '$_baseUrl/comment/create/$id';
  static String editCommentById(id) => '$_baseUrl/comment/update/$id';
  static String getCommentById(postId) => '$_baseUrl/comment/post/$postId';
  static String deleteCommentById(commentId) =>
      '$_baseUrl/comment/delete/$commentId';
  static String createReplyById(commentId) =>
      '$_baseUrl/comment/reply/create/$commentId';
  static String deleteReplyById(replyId) =>
      '$_baseUrl/comment/reply/delete/$replyId';
  static String editReplyById(replyId) =>
      '$_baseUrl/comment/reply/update/$replyId';

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

  static const String othersUserProfile = '$_baseUrl/user/get';
  static const String repostPost = '$_baseUrl/post/repost';

  //experience ---------
  static const String createExperience = '$_baseUrl/experience/create';
  static String experienceDelete = '$_baseUrl/experience/delete';
  static const String experienceUpdate = '$_baseUrl/experience/update/';

  //Education ---------
  static const String createEducation = '$_baseUrl/education/create';
  static String educationDelete = '$_baseUrl/education/delete';
  static const String educationUpdate = '$_baseUrl//education/update/';

  // Added by Shahriar
  static const String appliedItem = '$_baseUrl/application/getAppliedJob';
  static const String getProfileViewJob =
      '$_baseUrl/application/getProfileViewedJob';
  static const String getShortlistedJob =
      '$_baseUrl/application/getShortlistedJob';
  static const String getInterViewJob = '$_baseUrl/application/getInterviewJob';
  static const String getAllNotification = '$_baseUrl/notification/all';
  static String getSearchJobs(searchValue) =>
      '$_baseUrl/job/all?search=$searchValue';

  static const String addFavorite = '$_baseUrl/favorite/add';
  static const String removeFavorite = '$_baseUrl/favorite/delete';
  static const String changePassword = '$_baseUrl/user/change-password';
  static const String profileUpdate = '$_baseUrl/user/update';
  static const String getMyChatLists = '$_baseUrl/chat/getMyChat';

  static const String generateImageLink = "$_baseUrl/chats/generateFile";

  static String editPostById(postId) => "$_baseUrl/post/update/$postId";

  /// social login by sharif

  static const String socialLogin = "$_baseUrl/auth/login/social";

  // Added by @alphabetic100
  static const String appleSignIn = "$_baseUrl/auth/login/apple";
}
