import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/entity/product_entity.dart';
import 'package:fruits/features/home/domain/entities/cart_entity.dart';
import 'package:fruits/features/home/presentation/cubits/cart_cubit/cart_state.dart';

import '../../../domain/entities/cart_item_entity.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(cartItems: []);

  void addItemToCart(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isItemExist(productEntity);
    var cartItem = cartEntity.getCartItem(productEntity);
    if (isProductExist) {
      //increase ist of item
      cartItem.increaseCount();
    } else {
      cartEntity.addCartItem(cartItem);
    }
    emit(CartItemAdded());
  }

  void deleteCartItem(CartItemEntity cartItem) {
    cartEntity.removeCartItem(cartItem);
    emit(CartItemRemoved());
  }
}
