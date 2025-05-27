import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shuroo/features/jobs/presentation/screen/applied_job_screen.dart';
import 'package:shuroo/features/nav_bar/presentation/screens/nav_bar.dart';
import 'package:shuroo/features/search_notification_chat/presentation/screen/chat_screen.dart';
import 'package:shuroo/features/search_notification_chat/presentation/screen/notification_screen.dart';
import 'package:shuroo/features/search_notification_chat/presentation/screen/search_result_screen.dart';
import 'package:shuroo/features/search_notification_chat/presentation/screen/search_screen.dart';
import '../features/authentication/presentation/screens/account_confirm_screen.dart';
import '../features/authentication/presentation/screens/create_account_filled_screen.dart';
import '../features/authentication/presentation/screens/create_account_screen.dart';
import '../features/authentication/presentation/screens/reset_password_screen.dart';
import '../features/authentication/presentation/screens/sign_in_verification_code_screen.dart';
import '../features/authentication/presentation/screens/sign_up_verification_code_screen.dart';
import '../features/authentication/presentation/screens/forgot_password_screen.dart';
import '../features/authentication/presentation/screens/login_screen.dart';
import '../features/authentication/presentation/screens/sign_in_and_unlock_screen.dart';
import '../features/authentication/presentation/screens/sign_in_screen.dart';
import '../features/authentication/presentation/screens/sing_up_screen.dart';
import '../features/authentication/presentation/screens/terms_and condition_screen.dart';
import '../features/authentication/presentation/screens/verification_code_screen.dart';
import '../features/company_user _profile/presentation/screen/company_profile_screen.dart';
import '../features/company_user _profile/presentation/screen/other_user_profile_screen.dart';
import '../features/home/presentation/screen/home_screen.dart';
import '../features/jobs/presentation/screen/job_details_screen.dart';
import '../features/onboarding/screens/started_screen.dart';
import '../features/post_creation_repost_delete/presentation/screen/make_post_home_screen.dart';
import '../features/post_creation_repost_delete/presentation/screen/my_all_post_screen.dart';
import '../features/post_creation_repost_delete/presentation/screen/repost_with_throught_screen.dart';
import '../features/splash_screen/presentation/screens/splash_screen.dart';

class AppRoute {

  // All Auth screen
  static String loginScreen = "/loginScreen";
  static String signUpScreen = "/signUpScreen";
  static String startedScreen = "/startedScreen";
  static String createAccountDefaultScreen = "/createAccountDefaultScreen";
  static String createAccountScreen = "/createAccountScreen";
  static String createAccountFilledScreen = "/createAccountFilledScreen";
  static String termsAndConditionsScreen = "/termsAndConditionsScreen";
  static String signInAndUnlockScreen = "/signInAndUnlockScreen";
  static String signInScreen = "/signInScreen";
  static String otpScreen = "/otpScreen";
  static String forgotPasswordScreen = "/forgotPasswordScreen";
  static String signUpVeryficationCodeScreen = "/signUpVeryficationCodeScreen";
  static String signInVeryficationCodeScreen = "/signInVeryficationCodeScreen";
  static String resetPasswordScreen = "/resetPasswordScreen";
  static String accountConfirmScreen = "/accountConfirmScreen";
  static String homeScreen = "/homeScreen";
  static String makePostHomeScreen = "/makePostHomeScreen";
  static String repostWithThroughtScreen = "/repostWithThroughtScreen";
  static String companyProfileScreen = "/companyProfileScreen";
  static String myAllPostScreen = "/myAllPostScreen";
  static String jobDetailsScreen = "/jobDetailsScreen";
  static String otherUserProfileScreen = "/otherUserProfileScreen";
  static String init = "/";

  // Nev Bar
  static String nevBar = "/nevBar";

  static String appliedJobScreen = "/appliedJobScreen";
  static String notificationScreen = "/notificationScreen";
  static String searchingScreen = "/searchingScreen";
  static String searchResultScreen = "/searchResultScreen";
  static String chatScreen = "/chatScreen";

  static List<GetPage> routes = [

    // Auth
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: init, page: () =>  SplashScreen()),
    GetPage(name: startedScreen, page:() => const StartedScreen()),
    GetPage(name: createAccountScreen, page:() => const CreateAccountScreen()),
    GetPage(name: createAccountFilledScreen, page:() => CreateAccountFilledScreen()),
    GetPage(name: termsAndConditionsScreen, page:() => TermsAndConditionsScreen()),
    GetPage(name: signInAndUnlockScreen, page:() => SignInAndUnlockScreen()),
    GetPage(name: signInScreen, page:() => SignInScreen()),
    GetPage(name: signUpScreen, page:() => SignUpScreen()),
    GetPage(name: forgotPasswordScreen, page:() => ForgotPasswordScreen()),
    GetPage(name: signUpVeryficationCodeScreen, page:() => SignUpVeryficationCodeScreen()),
    GetPage(name: accountConfirmScreen, page:() => AccountConfirmScreen()),
    GetPage(name: resetPasswordScreen, page:() => ResetPasswordScreen()),
    GetPage(name: signInVeryficationCodeScreen, page:() => SignInVeryficationCodeScreen()),
    GetPage(name: homeScreen, page:() => HomeScreen()),
    GetPage(name: otpScreen, page:() => OtpScreen()),
    GetPage(name: makePostHomeScreen, page:() => MakePostHomeScreen()),
    GetPage(name: repostWithThroughtScreen, page:() => RepostWithThroughtScreen()),
    GetPage(name: myAllPostScreen, page:() => MyAllPostScreen()),
    GetPage(name: companyProfileScreen, page:() => CompanyProfileScreen()),
    GetPage(name: otherUserProfileScreen, page:() => OtherUserProfileScreen()),

    // Nev Bar
    GetPage(name: nevBar, page:() => NavBar()),
    GetPage(name: appliedJobScreen, page:() => AppliedJobScreen()),
    GetPage(name: notificationScreen, page:() => NotificationScreen()),
    GetPage(name: searchingScreen, page:() => SearchScreen()),
    GetPage(name: searchResultScreen, page:() => SearchResultScreen()),
    GetPage(name: jobDetailsScreen, page:() => JobDetailsScreen()),
    GetPage(name: chatScreen, page:() => ChatScreen()),


  ];
}