import 'package:flutter/material.dart';
import 'package:fruits/features/home/domain/entities/cart_item_entity.dart';

import 'cart_item.dart';

class CartItemsList extends StatelessWidget {

  const CartItemsList({required this.cartItems, super.key});
  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: CartItem(cartItemEntity: cartItems[index]),
        );
      },
    );
  }
}
