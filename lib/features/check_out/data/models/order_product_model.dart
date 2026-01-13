import 'package:fruits/features/home/domain/entities/cart_item_entity.dart';

class OrderProductModel {
  OrderProductModel({
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.code,
  });

  factory OrderProductModel.fromEntity({
    required CartItemEntity cartItemEntity,
  }) {
    return OrderProductModel(
      name: cartItemEntity.productEntity.name,
      price: cartItemEntity.productEntity.price.toDouble(),
      quantity: cartItemEntity.count,
      imageUrl: cartItemEntity.productEntity.imageUrl!,
      code: cartItemEntity.productEntity.code,
    );
  }

  toJson() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
      'imageUrl': imageUrl,
      'code': code,
    };
  }

  final String name;
  final double price;
  final int quantity;
  final String imageUrl;
  final String code;
}
