import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/circular_container.dart';
import 'package:t_store/common/widgets/texts/brand_cart.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CircularContainer(
      showBorder: true,
      borderColor: TColors.darkerGrey,
      bgColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          const BrandCard(showBorder: false),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Row(
            children: images
                .map((image) => brandTopImageWidget(image, context))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopImageWidget(String image, BuildContext context) {
    return Expanded(
      child: CircularContainer(
        height: 100,
        bgColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkerGrey
            : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
