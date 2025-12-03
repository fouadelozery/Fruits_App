import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';

class ProductRatingRow extends StatelessWidget {
  final double rating;
  final List reviews;

  const ProductRatingRow({
    super.key,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$rating ($reviews+) ",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
            color: AppColors.primaryColor,
          ),
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}
