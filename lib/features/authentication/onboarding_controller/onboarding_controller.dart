import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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
    if (currentPageIndex != null && currentPageIndex.value >= 0 && currentPageIndex.value < 2) {
      currentPageIndex.value++; // Increment page index
      pageController.animateToPage(
        currentPageIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // If currentPageIndex is null or out of bounds, navigate to the LoginScreen
      Get.offAll(const LoginScreen());
    }
  }



  void skipPage() {
    Get.offAll(const LoginScreen());
  }
}
