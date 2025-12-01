import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';

class ProductImageAndAppBar extends StatelessWidget {
  final String imageUrl;

  const ProductImageAndAppBar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 300,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 20),
          child: Image.network(imageUrl, fit: BoxFit.contain, height: 200),
        ),
        Positioned(
          top: 40,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                Icons.keyboard_arrow_up,
                color: AppColors.primaryColor,
                size: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
