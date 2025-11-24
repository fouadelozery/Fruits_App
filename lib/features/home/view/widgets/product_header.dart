import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/core/utiles/flutter_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({super.key, required this.productLength});
  final int productLength;

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
            color: AppColors.shadeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: SvgPicture.asset(Assets.imagesFilter),
        ),
      ],
    );
  }
}
