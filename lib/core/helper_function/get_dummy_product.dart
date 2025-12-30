import '../entity/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: "Fresh Apple",
    description: "Crispy sweet apples",
    price: 25,
    code: "APP001",
    isFeatured: true,
    expirationMonth: 6,
    numberOfCalories: 95,
    unitAmount: 1,
    imageUrl: null,
    reviews: [],
  );
}

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
