import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/common_section_heading.dart';
import 'package:t_store/common/widgets/custom_searchbar.dart';
import 'package:t_store/common/widgets/primary_header_container.dart';
import 'package:t_store/common/widgets/vertical_image_section.dart';
import 'package:t_store/features/shop/screens/home/widget/home_app_bar.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  const HomeAppBar(),
                  /// searchbar
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  const CustomSearchBar(
                    text: 'Search in Store',
                    showBackground: true,
                    showBorder: true,
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(

                      children: [
                        const SectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: TColors.white,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems,),
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (_, int index) {
                              return VerticalImageText(
                                image: TImages.shoeIcon,
                                text: 'Shoes',
                                onTap: () {},
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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

