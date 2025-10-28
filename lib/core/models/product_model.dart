import 'dart:io';

import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  String? imageUrl;
  final num price;
  final File image;
  final bool isFeature;
  final int expireByMonth;
  bool isOrginic;
  final int numOfCalories;
  num averageRating = 0;
  int ratingCount = 0;
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
    this.imageUrl,
    this.countSold = 0,
    required this.price,
    required this.image,
    required this.isFeature,
    required this.isOrginic,
    required this.reviews,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      code: json['code'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      image: File(
        '',
      ), // Placeholder, as we can't create File from JSON directly
      isFeature: json['isFeature'],
      expireByMonth: json['expireByMonth'],
      numOfCalories: json['numOfCalories'],
      unitAmount: json['unitAmount'],
      isOrginic: json['isOrginic'],
      reviews:
          (json['reviews'] as List)
              .map((e) => ReviewModel.fromJson(e))
              .toList(),
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
      isOrginic: isOrginic,
      reviews: reviews.map((e) => e.toEntity()).toList(),
      countSold: countSold,
      image: image,
      isOrganic: isOrginic,
    );
  }

  toJson() {
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
