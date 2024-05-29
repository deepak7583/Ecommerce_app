import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/app_bar/app_bar.dart';
import 'package:t_store/common/widgets/brands/brand_cart.dart';
import 'package:t_store/common/widgets/common_section_heading.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/features/shop/screens/brand/brand_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const SectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Brands
              CustomGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (context, index) {
                  return BrandCard(
                    showBorder: true,
                    onTap: () {
                      Get.to(const BrandProducts());
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
