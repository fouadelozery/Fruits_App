import 'package:e_commerce/core/entities/product_entity.dart';

ProductEntity getDummyProduct = ProductEntity(
  name: "Avocado",
  code: "AVO-001",
  description: "Fresh organic avocado",
  price: 5.99,
  imageUrl: "assests/images/fruit2.jpg",
  isFeature: true,
  expireByMonth: 2,
  numOfCalories: 160,
  unitAmount: 1,
  reviews: [],
  countSold: 10,
  isOrginic: true,
  averageRating: 5,
  ratingCount: 20,
);
List<ProductEntity> getDemoProducts() {
  return [
    getDummyProduct,
    getDummyProduct,
    getDummyProduct,
    getDummyProduct,
    getDummyProduct,
    getDummyProduct,
  ];
}
