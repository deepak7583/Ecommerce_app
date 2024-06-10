import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/shimmer/category_shimmer.dart';
import 'package:t_store/common/widgets/vertical_image_section.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/sub_category/sub_categories.dart';


class HeaderCategories extends StatelessWidget {
  const HeaderCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) return const CategoryShimmer();
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data Found!',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (_, int index) {
            final category = categoryController.featuredCategories[index];
            return VerticalImageText(
              image: category.image,
              text: category.name,
              onTap: () {
                Get.to(const SubCategoriesScreen());
              },
            );
          },
        ),
      );
    });
  }
}
