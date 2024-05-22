import 'package:flutter/material.dart';
import 'package:t_store/common/texts/product_title_text.dart';
import 'package:t_store/common/widgets/circular_container.dart';
import 'package:t_store/common/widgets/image/circular_image.dart';
import 'package:t_store/common/widgets/products/products_cart/product_price_cart.dart';
import 'package:t_store/common/widgets/texts/brand_title_with_verifiedicon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircularContainer(
              radius: TSizes.sm,
              bgColor: TColors.secondary.withOpacity(0.5),
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.sm,
                vertical: TSizes.xs,
              ),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            const ProductPriceCart(
              price: '175',
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems / 1.5,
        ),
        const ProductTitleText(title: 'Green Nike Sports Shirt'),
        const SizedBox(
          width: TSizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            const ProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            CircularImage(
              image: TImages.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            const BrandTittleWithVerifiedIcon(
              title: 'Nike',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
