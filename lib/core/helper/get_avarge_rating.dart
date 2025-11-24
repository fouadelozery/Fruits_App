import 'package:e_commerce/core/entities/review_entity.dart';

num getAvaragingRating(List<ReviewEntity> reviews) {
  num totalRating = 0;
  for (var review in reviews) {
    totalRating += review.rating;
  }
  return totalRating / reviews.length;
}
