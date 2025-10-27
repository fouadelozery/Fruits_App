import 'dart:io';

import 'package:e_commerce/core/entities/review_entity.dart';


class AddProductEntity {
  final String name;
  final String code;
  final String description;
  String? imageUrl;
  final num price;
  final File image;
  final bool isFeature;
  final int expireByMonth;
  bool isOrginic = true;
  final int numOfCalories;
  num averageRating = 0;
  int ratingCount = 0;
  final int unitAmount;
  final List<ReviewEntity> reviews;

  AddProductEntity({
    required this.expireByMonth,
    required this.numOfCalories,
    required this.unitAmount,
    required this.name,
    required this.code,
    required this.description,
    this.imageUrl,
    required this.price,
    required this.image,
    required this.isFeature, required bool isOrganic,
     required this.reviews,
  });
}
