import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screens/product_detail/widgets/product_image_slider.dart';
import 'package:t_store/features/shop/screens/product_detail/widgets/product_meta_deta.dart';
import 'package:t_store/features/shop/screens/product_detail/widgets/rating_share_widget.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          /// Product image sidebar
          ProductImageSlider(),
          /// Product details
          Padding(
            padding: EdgeInsets.only(
              right: TSizes.defaultSpace,
              left: TSizes.defaultSpace,
              bottom: TSizes.defaultSpace,
            ),
            child: Column(
              children: [
                /// Rating & share button
                RatingAndShare(),
                /// price , title , Stack & Brand
                ProductMetaData(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
