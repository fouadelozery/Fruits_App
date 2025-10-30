import 'dart:io';

import 'package:e_commerce/core/entities/review_entity.dart';

class ProductEntity {
  final String name;
  final String code;
  final String description;
  String? imageUrl;
  final num price;
  final bool isFeature;
  final int expireByMonth;
   final  bool isOrginic ;
  final int numOfCalories;
  num averageRating = 0;
  int ratingCount = 0;
  final int unitAmount;
  final List<ReviewEntity> reviews;

  ProductEntity( {
    required this.expireByMonth,
    required this.numOfCalories,
    required this.unitAmount,
    required this.name,
    required this.code,
    required this.description,
    this.imageUrl,
    required this.price,
    required this.isFeature,
    required this.isOrginic,
    required this.reviews,
    required int countSold,  required num averageRating, required int ratingCount,
  });
}
