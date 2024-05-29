import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/products/cart/add_remove_button.dart';
import 'package:t_store/common/widgets/products/cart/cart_item.dart';
import 'package:t_store/common/widgets/products/products_cart/product_price_cart.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CartItemsNew extends StatelessWidget {
  const CartItemsNew({
    super.key,
     this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            const CartItem(),
            if (showAddRemoveButtons)
              const SizedBox(height: TSizes.spaceBtwItems),

            /// Add remove button row with total Price
            if (showAddRemoveButtons)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70),

                      /// Add remove buttons
                      ProductQuantityWithAddRemoveButton(),
                    ],
                  ),

                  /// product total price
                  ProductPriceCart(price: '256'),
                ],
              ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: TSizes.spaceBtwSections);
      },
    );
  }
}
