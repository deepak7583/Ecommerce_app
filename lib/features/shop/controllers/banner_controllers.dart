import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/loaders.dart';
import 'package:t_store/data/repositories/banners/BannerRepository.dart';
import 'package:t_store/features/shop/models/bannerr_model.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  /// Variables
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// Update page navigation dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  /// Fetch Banners

  Future<void> fetchBanners() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;
      // Fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();
      // Assign all banners
      this.banners.assignAll(banners);
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap,', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
