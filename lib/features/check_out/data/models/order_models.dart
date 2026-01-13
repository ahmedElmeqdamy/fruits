import 'package:fruits/features/check_out/data/models/shipping_address_model.dart';
import 'package:fruits/features/check_out/domain/entites/order_entity.dart';

import 'order_product_model.dart';

class OrderModels {
  OrderModels({
    required this.paymentMethod,
    required this.orderProduct,
    required this.totalPrice,
    required this.uID,
    required this.shippingAddressModels,
  });
// this factory method is used to convert the order entity to order models
  factory OrderModels.fromEntity({required OrderEntity orderEntity}) {
    return OrderModels(
      paymentMethod: orderEntity.payedWithCash!? 'Cash':'Paypal',
      orderProduct: orderEntity.cartEntity.cartItems
          .map((e) => OrderProductModel.fromEntity(cartItemEntity: e))
          .toList(),
      totalPrice: orderEntity.cartEntity.calculateTotalPrice(),
      uID: orderEntity.uID,
      shippingAddressModels: ShippingAddressModels.fromEntity(
        orderEntity.shippingAddress,
      ),
    );
  }
// this method is used to convert the order entity to map to add it to the database specific firestore
  Map<String, dynamic> toJson() {
    return {
      'paymentMethod': paymentMethod,
      'orderProduct': orderProduct.map((e) => e.toJson()).toList(),
      'totalPrice': totalPrice,
      'uID': uID,
      'shippingAddressModels': shippingAddressModels.toJson(),
    };
  }

  final double totalPrice;
  final String uID;
  final ShippingAddressModels shippingAddressModels;
  final List<OrderProductModel> orderProduct;
  final String paymentMethod;
}
