import 'package:get/get.dart';

import '../features/authentication/presentation/screens/create_account_screen.dart';
import '../features/authentication/presentation/screens/create_account_default_screen.dart';
import '../features/authentication/presentation/screens/create_account_filled_screen.dart';
import '../features/authentication/presentation/screens/forgot_password_screen.dart';
import '../features/authentication/presentation/screens/login_screen.dart';
import '../features/authentication/presentation/screens/sign_in_and_unlock_screen.dart';
import '../features/authentication/presentation/screens/sign_in_screen.dart';
import '../features/authentication/presentation/screens/sign_in_veryfication_code_screen.dart';
import '../features/authentication/presentation/screens/sing_up_screen.dart';
import '../features/onboarding/screens/started_screen.dart';
import '../features/authentication/presentation/screens/terms_and condition_screen.dart';
import '../features/authentication/presentation/screens/verification_code_screen.dart';
import '../features/splash_screen/presentation/screens/splash_screen.dart';

class AppRoute {
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
  static String signInVeryficationCodeScreen = "/signInVeryficationCodeScreen";
  static String init = "/";


  static List<GetPage> routes = [
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: init, page: () =>  SplashScreen()),
    GetPage(name: startedScreen, page:() => const StartedScreen()),
    GetPage(name: createAccountScreen, page:() => const CreateAccountScreen()),
    GetPage(name: createAccountDefaultScreen, page:() => CreateAccountDefaultScreen()),
    GetPage(name: createAccountFilledScreen, page:() => CreateAccountFilledScreen()),
    GetPage(name: termsAndConditionsScreen, page:() => TermsAndConditionsScreen()),
    GetPage(name: signInAndUnlockScreen, page:() => SignInAndUnlockScreen()),
    GetPage(name: signInScreen, page:() => SignInScreen()),
    GetPage(name: signUpScreen, page:() => SignUpScreen()),
    GetPage(name: forgotPasswordScreen, page:() => ForgotPasswordScreen()),
    GetPage(name: signInVeryficationCodeScreen, page:() => SignInVeryficationScreen()),
    GetPage(name: otpScreen, page:() => OtpScreen()),
  ];
}