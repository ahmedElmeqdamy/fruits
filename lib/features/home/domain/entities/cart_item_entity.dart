import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/entity/product_entity.dart';
class CartItemEntity extends Equatable{

  CartItemEntity({required this.productEntity, this.count = 0});
  int count;

  ProductEntity productEntity;

  num calculateTotalPrice() {
    return count * productEntity.price;
  }

  num calculateTotalWeight() {
    return count * productEntity.unitAmount;
  }

  int increaseCount() {
    return count++;
  }

  int decreaseCount() {
    return count--;
  }

  @override
  List<Object?> get props => [productEntity];
}
