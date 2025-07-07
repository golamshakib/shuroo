import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SingUpController extends GetxController{
  var isGoogleLoading = false.obs;

  Future<dynamic> googleLogin() async {
    try {
      isGoogleLoading.value = true;
      await GoogleSignIn().signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    } catch (e) {

    }
  }
}