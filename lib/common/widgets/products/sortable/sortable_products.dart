import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/products/products_cart/product_cart_vertical.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Icons.sort)),
          onChanged: (value) {},
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity',
          ]
              .map(
                (option) => DropdownMenuItem(
                  value: option,
                  child: Text(option),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        /// Products
        CustomGridLayout(
          itemCount: 6,
          itemBuilder: (_, index) {
            return const ProductCartVertical();
          },
        ),
      ],
    );
  }
}
