import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/common/widgets/loaders/loaders.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL')??'';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD')??'';
    super.onInit();
  }

  /// Email and password sign in
  Future<void> emailAndPasswordSignIn() async {
    try {
      // start loading
      FullScreenLoader.openLoadingDialog(
        text: 'Logging you in...',
        animation: TImages.docerAnimation,
      );
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Save data if remember me selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
// Login user using email and password authentication
      final userCred =
          await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );
      // remove loader
      FullScreenLoader.stopLoading();
      // Redirect
      AuthenticationRepository.instance.screeRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      // show error
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Google SignIn
  Future<void> googleSignIn() async {
    try {
      // start loading
      FullScreenLoader.openLoadingDialog(
          text: 'Logging you in...', animation: TImages.docerAnimation);
      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      // google authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();
      // save user record
      await userController.saveUserRecord(userCredentials);
      // remove loader
      FullScreenLoader.stopLoading();
      // Redirect
      AuthenticationRepository.instance.screeRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
