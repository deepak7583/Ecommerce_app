import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/loaders.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// SignUp

  Future<void> signUp() async {
    try {
      // start loading
      FullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        TImages.facebook,
      );
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        Loaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
          'In order to create account, you must have to read and accept the privacy policy & terms of use',
        );
        return;
      }

      //
    } catch (e) {
      // show error
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      FullScreenLoader.stopLoading();
    }
  }
}
