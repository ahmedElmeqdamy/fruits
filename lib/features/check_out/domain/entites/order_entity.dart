import 'package:fruits/features/check_out/domain/entites/shipping_address_entity.dart';
import 'package:fruits/features/home/domain/entities/cart_entity.dart';

class OrderEntity {
  OrderEntity({
    required this.uID,
    required this.cartEntity,
    this.payedWithCash,
  });

  final String uID;
  final CartEntity cartEntity;
  bool? payedWithCash;
  ShippingAddressEntity shippingAddress = ShippingAddressEntity();
}
