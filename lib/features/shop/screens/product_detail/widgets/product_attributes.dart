import 'package:flutter/material.dart';
import 'package:t_store/common/texts/product_title_text.dart';
import 'package:t_store/common/widgets/chip/custom_chip.dart';
import 'package:t_store/common/widgets/circular_container.dart';
import 'package:t_store/common/widgets/common_section_heading.dart';
import 'package:t_store/common/widgets/products/products_cart/product_price_cart.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        CircularContainer(
          padding: const EdgeInsets.all(TSizes.md),
          bgColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const SectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(
                            title: 'Price : ',
                            smallSize: true,
                          ),
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          const ProductPriceCart(price: '20'),
                        ],
                      ),
                      Row(
                        children: [
                          const ProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// VD
              const ProductTitleText(
                title:
                    'This is the description of the project and it can go up to max 4 lines',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
const SizedBox(height: TSizes.spaceBtwItems,),
        /// Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: 'Colors',showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(text: 'Green', selected:  true,onSelected: (value) {},),
                CustomChoiceChip(text: 'Blue', selected:  false,onSelected: (value) {},),
                CustomChoiceChip(text: 'Yellow', selected:  false,onSelected: (value) {},),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: 'Size',showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(text: 'EU 34', selected:  false,onSelected: (value) {},),
                CustomChoiceChip(text: 'EU 36', selected:  true,onSelected: (value) {},),
                CustomChoiceChip(text: 'EU 38', selected:  false,onSelected: (value) {},),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

