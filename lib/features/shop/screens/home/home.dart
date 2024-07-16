import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/common_section_heading.dart';
import 'package:t_store/common/widgets/custom_searchbar.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/primary_header_container.dart';
import 'package:t_store/common/widgets/products/products_cart/product_cart_vertical.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/features/shop/screens/home/widget/header_categories.dart';
import 'package:t_store/features/shop/screens/home/widget/home_app_bar.dart';
import 'package:t_store/features/shop/screens/home/widget/promo_slider.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PrimaryHeaderContainer(
              child: Column(
                children: [
                  HomeAppBar(),
                  /// searchbar
                  SizedBox(height: TSizes.spaceBtwItems),
                  CustomSearchBar(
                    text: 'Search in Store',
                    showBackground: true,
                    showBorder: true,
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: TColors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),
                        HeaderCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const PromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SectionHeading(
                    title: 'Popular Products',
                    onPressed: () {
                      Get.to(const AllProducts());
                    },
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  CustomGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, int index) {
                      return const ProductCartVertical();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
