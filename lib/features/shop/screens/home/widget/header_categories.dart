import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/vertical_image_section.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class HeaderCategories extends StatelessWidget {
  const HeaderCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
