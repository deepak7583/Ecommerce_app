
import 'package:get/get.dart';
import 'package:t_store/features/personalization/screens/settings/settings.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/features/shop/screens/store/store.dart';
import 'package:t_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:t_store/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: Routes.home, page: () => const HomeScreen()),
    GetPage(name: Routes.store, page: () => const StoreScreen()),
    GetPage(name: Routes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: Routes.settings, page: () => const SettingsScreen()),
  ];
}