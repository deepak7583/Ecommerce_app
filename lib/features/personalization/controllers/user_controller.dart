import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/loaders.dart';
import 'package:t_store/data/model/user_model.dart';
import 'package:t_store/data/repositories/user_repository/user_repository.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());

  /// save user from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        // Convert name to first  and last name
        final nameParts =
            UserModel.nameParts(userCredential.user?.displayName ?? '');
        final userName =
            UserModel.generateUserName(userCredential.user?.displayName ?? '');
        // Map Data
        final user = UserModel(
          id: userCredential.user!.uid,
          userName: userName,
          email: userCredential.user?.email ?? '',
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          phoneNumber: userCredential.user?.phoneNumber ?? '',
          profilePicture: userCredential.user?.photoURL ?? '',
        );
        // Save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      Loaders.warningSnackBar(
        title: "title",
        message:
            'Something went wrong while saving your information. You can re -save your data in your Profile',
      );
    }
  }
}
