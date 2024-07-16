import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/app_bar/app_bar.dart';
import 'package:t_store/common/widgets/app_bar/tab_bar.dart';
import 'package:t_store/common/widgets/products/cart/cart_menu_icn.dart';
import 'package:t_store/common/widgets/category_tab/category_tab.dart';
import 'package:t_store/common/widgets/common_section_heading.dart';
import 'package:t_store/common/widgets/custom_searchbar.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/brands/brand_cart.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/brand/all_brands.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: buildBaseAppBar(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const CustomSearchBar(
                        text: 'Search in store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      SectionHeading(
                        title: 'Feature Brands',
                        onPressed: () {
                          Get.to(const AllBrandsScreen());
                        },
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                      CustomGridLayout(
                        mainAxisExtent: 80,
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          return const BrandCard(
                            showBorder: true,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                bottom: CustomTabBar(
                  tabs: categories
                      .map((category) => Tab(child: Text(category.name)))
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: categories
                .map((category) => CategoryTab(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }

  BaseAppBar buildBaseAppBar() {
    return BaseAppBar(
      title: const Text('Store'),
      actions: [
        CartMenuIcon(
          onPressed: () {},
        ),
      ],
    );
  }
}
