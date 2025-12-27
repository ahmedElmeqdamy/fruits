import '../entity/review_entity.dart';

class ReviewModel{
  ReviewModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.date,
    required this.reviewDescription,
  });

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      rating: reviewEntity.rating,
      date: reviewEntity.date,
      reviewDescription: reviewEntity.reviewDescription,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'] as String,
      image: json['image'] as String,
      rating: json['rating'] as num,
      date: json['date'] as String,
      reviewDescription: json['reviewDescription'] as String,
    );
  }

  final String name;
  final String image;
  final num rating;
  final String date;
  final String reviewDescription;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'rating': rating,
      'date': date,
      'reviewDescription': reviewDescription,
    };
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      image: image,
      rating: rating,
      date: date,
      reviewDescription: reviewDescription,
    );
  }
}
