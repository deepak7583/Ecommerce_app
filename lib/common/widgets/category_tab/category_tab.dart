import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brands/brand_show_case.dart';
import 'package:t_store/common/widgets/common_section_heading.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/products/products_cart/product_cart_vertical.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const BrandShowCase(
                images: [
                  TImages.productImage3,
                  TImages.productImage2,
                  TImages.productImage1,
                ],
              ),
              SectionHeading(
                title: 'You might like',
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              CustomGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => const ProductCartVertical(),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
