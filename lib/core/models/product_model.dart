import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/helper/get_avarge_rating.dart';
import 'package:e_commerce/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final String? imageUrl;
  final num price;
  final bool isFeature;
  final int expireByMonth;
  final bool isOrginic;
  final int numOfCalories;
  final num averageRating;
  final int ratingCount;
  final int unitAmount;
  final List<ReviewModel> reviews;
  final int countSold;

  ProductModel({
    required this.expireByMonth,
    required this.numOfCalories,
    required this.unitAmount,
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.isFeature,
    required this.isOrginic,
    required this.reviews,
    this.imageUrl,
    this.countSold = 0,
    this.averageRating = 0,
    this.ratingCount = 0,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final reviewList =
        (json['reviews'] as List? ?? [])
            .map((e) => ReviewModel.fromJson(e))
            .toList();

    return ProductModel(
      countSold: json['countSold'] ?? 0,
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'],
      price: json['price'] ?? 0,
      isFeature: json['isFeature'] ?? false,
      expireByMonth: json['expireByMonth'] ?? 0,
      numOfCalories: json['numOfCalories'] ?? 0,
      unitAmount: json['unitAmount'] ?? 0,
      isOrginic: json['isOrginic'] ?? true,
      reviews: reviewList,
      averageRating: getAvaragingRating(
        reviewList.map((r) => r.toEntity()).toList(),
      ),
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      description: description,
      imageUrl: imageUrl,
      price: price,
      isFeature: isFeature,
      expireByMonth: expireByMonth,
      numOfCalories: numOfCalories,
      unitAmount: unitAmount,
      reviews: reviews.map((e) => e.toEntity()).toList(),
      countSold: countSold,
      averageRating: averageRating,
      ratingCount: ratingCount,
      isOrginic: isOrginic,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "code": code,
      "description": description,
      "price": price,
      "imageUrl": imageUrl,
      "isFeature": isFeature,
      "expireByMonth": expireByMonth,
      "numOfCalories": numOfCalories,
      "unitAmount": unitAmount,
      "isOrginic": isOrginic,
      "reviews": reviews.map((e) => e.tojson()).toList(),
      "countSold": countSold,
    };
  }
}
