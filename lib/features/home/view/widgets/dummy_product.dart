import 'package:e_commerce/core/entities/product_entity.dart';

ProductEntity getDummyAppleProduct = ProductEntity(
  name: "Apple",
  code: "APL-001",
  description: "Fresh and crispy apples, perfect for a healthy snack.",
  price: 3.99,
  imageUrl:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCOpoKE_zWYCMdLy7xbsWKawR6w7mm9dfXsg&s",
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
