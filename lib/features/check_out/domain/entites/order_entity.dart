import 'package:fruits/features/check_out/domain/entites/shipping_address_entity.dart';
import 'package:fruits/features/home/domain/entities/cart_entity.dart';

class OrderEntity {
  OrderEntity({
   required this.cartEntity, this.shippingAddress,
     this.payedWithCash,
  });

final CartEntity cartEntity;
   bool? payedWithCash;
  final ShippingAddressEntity? shippingAddress;
}
