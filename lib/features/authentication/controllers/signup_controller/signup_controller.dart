import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/loaders.dart';
import 'package:t_store/data/model/user_model.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user_repository/user_repository.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// SignUp
  void signUp() async {
    try {
      // start loading
      FullScreenLoader.openLoadingDialog(
        text: 'We are processing your information...',
        animation: TImages.docerAnimation,
      );
      debugPrint('Loader@@@@@------>');
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        FullScreenLoader.stopLoading();
        Loaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create account, you must have to read and accept the privacy policy & terms of use',
        );
        return;
      }
// Register user in firebase Authentication & save user data in the firebase
      final userCred =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );
      // Save Authentication user data
      final newUser = UserModel(
        id: userCred.user!.uid,
        userName: userName.text.trim(),
        email: email.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      //
      FullScreenLoader.stopLoading();
      // show success message
      Loaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue',
      );
      // move to verify email
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim(),));
    } catch (e) {
      // remove loader
      FullScreenLoader.stopLoading();
      // show error
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
