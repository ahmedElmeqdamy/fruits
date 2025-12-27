import 'dart:io';

import 'package:fruits/core/entity/review_entity.dart';

class ProductEntity {
  ProductEntity({
    required this.name,
    required this.description,
    required this.price,
    required this.code,
    required this.isFeatured,
    required this.expirationMonth,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
    this.imageUrl,
    this.isOrganic = false,
  });

  final String name;
  final String description;
  final num price;
  final String code;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonth;
  bool isOrganic;
  final int numberOfCalories;
  final num averageRating = 0;
  final int ratingCount = 0;
  final int unitAmount;
  final List<ReviewEntity> reviews;
}
