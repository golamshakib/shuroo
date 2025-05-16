import 'package:get/get.dart';

import '../features/authentication/presentation/screens/create_account.dart';
import '../features/authentication/presentation/screens/create_account_default_screen.dart';
import '../features/authentication/presentation/screens/create_account_filled_screen.dart';
import '../features/authentication/presentation/screens/login_screen.dart';
import '../features/authentication/presentation/screens/sing_up_screen.dart';
import '../features/authentication/presentation/screens/started_screen.dart';
import '../features/splash_screen/presentation/screens/splash_screen.dart';

class AppRoute {
  static String loginScreen = "/loginScreen";
  static String signUpScreen = "/signUpScreen";
  static String startedScreen = "/signUpScreen";
  static String createAccountDefaultScreen = "/createAccountDefaultScreen";
  static String createAccountScreen = "/createAccountScreen";
  static String createAccountFilledScreen = "/createAccountFilledScreen";
  static String init = "/";


  static List<GetPage> routes = [
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: init, page: () =>  SplashScreen()),
    GetPage(name: startedScreen, page:() => const StartedScreen()),
    GetPage(name: createAccountScreen, page:() => const CreateAccountScreen()),
    GetPage(name: createAccountDefaultScreen, page:() => CreateAccountDefaultScreen()),
    GetPage(name: createAccountFilledScreen, page:() => CreateAccountFilledScreen()),
  ];
}