import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/authentication/screens/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void nextPage() {
    // Check if currentPageIndex is not null and within bounds
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();
      if (kDebugMode) {
        print('============== GET STORAGE NEXT Buttom ===============');
        print(storage.read('IsFirstTime'));
      }
      storage.write('IsFirstTime', false);
      Get.offAll(const LoginScreen());
    } else {
      // If currentPageIndex is null or out of bounds, navigate to the LoginScreen
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage() {
    Get.offAll(const LoginScreen());
  }
}
