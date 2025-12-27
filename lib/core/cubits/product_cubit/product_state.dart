import 'package:flutter/material.dart';

import '../../entity/product_entity.dart';
@immutable
final class ProductStates {}

final class ProductInitial extends ProductStates {}

final class ProductLoading extends ProductStates {}

final class ProductSuccess extends ProductStates {
  ProductSuccess({required this.products});

  final List<ProductEntity> products;
}

final class ProductError extends ProductStates {
  ProductError({required this.errorMessage});

  final String errorMessage;
}
