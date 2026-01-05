import 'package:fruits/core/entity/product_entity.dart';

import 'cart_item_entity.dart';

class CartEntity {
  CartEntity({required this.cartItems});

  List<CartItemEntity> cartItems;

  void addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  void removeCartItem(CartItemEntity cartItemEntity) {
    cartItems.remove(cartItemEntity);
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.calculateTotalPrice();
    }
    return totalPrice;
  }

  bool isItemExist(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == product) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == product) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: product, count: 1);
  }
}
