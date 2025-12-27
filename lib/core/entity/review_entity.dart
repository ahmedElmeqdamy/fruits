class ReviewEntity {

  ReviewEntity({
    required this.name,
    required this.image,
    required this.rating,
    required this.date,
    required this.reviewDescription,
  });
  final String name;
  final String image;
  final num rating;
  final String date;
  final String reviewDescription;
}
