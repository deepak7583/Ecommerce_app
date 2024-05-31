import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    // remove the native splash
    FlutterNativeSplash.remove();
    // Redirect to appropriate screen
    screeRedirect();
  }

  /// function to show relevant screen
  screeRedirect() async {
    // Local storage
    if (kDebugMode) {
      print('============== GET STORAGE ===============');
      print(deviceStorage.read('IsFirstTime'));
    }
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const OnBoardingScreen());
  }
/*--------------------------- Email & Password sign-In -------------------------- */

  ///[EmailAuthentication] - SignIn
  ///[EmailAuthentication] - REGISTER
   Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
     try {
       return await _auth.createUserWithEmailAndPassword(email: email, password: password);
     } on FirebaseException catch (e) {

     } throw '';
   }
}
