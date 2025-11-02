import 'package:e_commerce/core/entities/product_entity.dart';

ProductEntity getDummyAppleProduct = ProductEntity(
  name: "Apple",
  code: "APL-001",
  description: "assests/images/item.png",
  price: 3.99,
  imageUrl: "",
  isFeature: true,
  expireByMonth: 1,
  numOfCalories: 95,
  unitAmount: 1,
  reviews: [],
  countSold: 50,
  averageRating: 4.5,
  ratingCount: 20,
  isOrginic: true,
);

List<ProductEntity> getDemoProducts() {
  return [
    getDummyAppleProduct,
    getDummyAppleProduct,
    getDummyAppleProduct,
    getDummyAppleProduct,
  ];
}
