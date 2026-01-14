import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/entity/product_entity.dart';
class CartItemEntity extends Equatable{

  CartItemEntity({required this.productEntity, this.quantity = 0});
  int quantity;

  ProductEntity productEntity;

  num calculateTotalPrice() {
    return quantity * productEntity.price;
  }

  num calculateTotalWeight() {
    return quantity * productEntity.unitAmount;
  }

  int increaseCount() {
    return quantity++;
  }

  int decreaseCount() {
    return quantity--;
  }

  @override
  List<Object?> get props => [productEntity];
}
