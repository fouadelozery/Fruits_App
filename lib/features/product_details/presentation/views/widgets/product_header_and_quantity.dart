import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';
import 'quantity_selector.dart';

class ProductHeaderAndQuantity extends StatelessWidget {
  final String name;
  final double price;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const ProductHeaderAndQuantity({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          price.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: QuantitySelector(
            quantity: quantity,
            onAdd: onAdd,
            onRemove: onRemove,
          ),
        ),
      ],
    );
  }
}
