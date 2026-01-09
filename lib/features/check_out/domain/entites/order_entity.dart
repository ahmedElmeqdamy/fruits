import 'package:fruits/features/check_out/domain/entites/shipping_address_entity.dart';
import 'package:fruits/features/home/domain/entities/cart_item_entity.dart';

class OrderEntity {
  OrderEntity({
    required this.shippingAddress,
    required this.cartItems,
    required this.payedWithCash,
  });

  List<CartItemEntity> cartItems;
  final bool payedWithCash;
  final ShippingAddressEntity shippingAddress;
}
