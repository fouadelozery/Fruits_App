import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final String description;

  const ProductDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        fontSize: 16,
        color: AppColors.primaryColor,
        height: 1.5,
      ),
      textAlign: TextAlign.right,
    );
  }
}
