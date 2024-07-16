
import 'package:t_store/features/shop/models/bannerr_model.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/routes/routes.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class DummyData {
  /// -- Banners
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: TImages.banner1, targetScreen: Routes.store, active: false),
  ];
  /// -- List of all categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Furniture', image: TImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Electronics', image: TImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Clothes', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Shoes', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(id: '7', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(id: '14', name: 'Jewelery', image: TImages.jeweleryIcon, isFeatured: true),
  /// Sub categories
    CategoryModel(id: '8', name: 'Sport Shoes',parentId: '1', image: TImages.sportIcon, isFeatured: false),
    CategoryModel(id: '9', name: 'Track  suits',parentId: '1', image: TImages.sportIcon, isFeatured: false),
    CategoryModel(id: '10', name: 'Sports Equipments',parentId: '1', image: TImages.sportIcon, isFeatured: false),
    // Furniture
    CategoryModel(id: '11', name: 'Bedroom furniture',parentId: '5', image: TImages.furnitureIcon, isFeatured: false),
    CategoryModel(id: '12', name: 'Kitchen furniture',parentId: '5', image: TImages.furnitureIcon, isFeatured: false),
    CategoryModel(id: '13', name: 'Office furniture',parentId: '5', image: TImages.furnitureIcon, isFeatured: false),
    //electronics
    CategoryModel(id: '14', name: 'Laptop',parentId: '2', image: TImages.electronicsIcon, isFeatured: false),
    CategoryModel(id: '15', name: 'Mobile',parentId: '2', image: TImages.electronicsIcon, isFeatured: false),

    CategoryModel(id: '16', name: 'Shirts',parentId: '3', image: TImages.clothIcon, isFeatured: false),

  ];
}