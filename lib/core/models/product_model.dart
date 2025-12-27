import 'package:fruits/core/entity/product_entity.dart';
import 'package:fruits/core/models/review_model.dart';

import '../entity/review_entity.dart';

class ProductModel {
  ProductModel({
    // required this.reviews,
    required this.sellingCount,
    required this.name,
    required this.description,
    required this.price,
    required this.code,
    required this.averageRating,
    required this.isFeatured,
    required this.expirationMonth,
    required this.unitAmount,
    required this.numberOfCalories,
    required this.reviews,
    this.imageUrl,
    this.isOrganic = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final reviewsList =
        (json['reviews'] as List<dynamic>?)
            ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];

    return ProductModel(
      imageUrl: json['imageUrl'] as String?,
      sellingCount: json['sellingCount'] as num,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as num,
      code: json['code'] as String,
      isFeatured: json['isFeatured'] as bool,
      expirationMonth: json['expirationMonth'] as int,
      unitAmount: json['unitAmount'] as int,
      numberOfCalories: json['numberOfCalories'] as int,
      reviews: reviewsList,
      averageRating: getAverageRating(
        reviewsList.map((e) => e.toEntity()).toList(),
      ),
    );
  }

  final String name;
  final String description;
  final num price;
  final String code;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonth;
  bool isOrganic = false;
  final int numberOfCalories;
  final num averageRating;
  final int ratingCount = 0;
  final int unitAmount;
  final List<ReviewModel> reviews;
  final num sellingCount;

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      description: description,
      price: price,
      code: code,
      imageUrl: imageUrl,
      isFeatured: isFeatured,
      expirationMonth: expirationMonth,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'code': code,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonth': expirationMonth,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'averageRating': averageRating,
      'ratingCount': ratingCount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((value) => value.toJson()).toList(),
    };
  }
}

num getAverageRating(List<ReviewEntity> reviews) {
  num totalRating = 0;
  for (var review in reviews) {
    totalRating += review.rating;
  }
  return totalRating / reviews.length;
}
