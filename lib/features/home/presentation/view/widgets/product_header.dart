import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/core/utiles/flutter_assets.dart';
import 'package:flutter/material.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({
    super.key,
    required this.productLength,
    required this.onFilterPressed,
  });
  final int productLength;
  final VoidCallback onFilterPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$productLength منتجات متاحة",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: GestureDetector(
            onTap: onFilterPressed,
            child: IconButton(
              onPressed: onFilterPressed,
              icon: Icon(Icons.filter_list_alt, color: AppColors.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
