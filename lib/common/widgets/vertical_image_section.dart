import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/image/circular_image.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.image,
    required this.text,
    this.textColor = TColors.white,
    this.bgColor,
    required this.onTap,
    this.isNetworkImage = true,
  });

  final String image, text;
  final Color textColor;
  final Color? bgColor;
  final bool isNetworkImage;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            CircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: TSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              bgColor: bgColor,
              overlayColor: THelperFunctions.isDarkMode(context)
                  ? TColors.light
                  : TColors.dark,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
