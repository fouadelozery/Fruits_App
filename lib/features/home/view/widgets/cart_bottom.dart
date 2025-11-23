import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/features/home/domain/entity/car_item_entity.dart';
import 'package:e_commerce/features/home/presentation/cubits/card_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartButton extends StatefulWidget {
  const CartButton({super.key, required this.cardEntity});
  final CarItemEntity cardEntity;

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  int get _quantity => widget.cardEntity.quantity;

  void _incrementQuantity() {
    setState(() {
      context.read<CartCubit>().increaseProductQuantity(
        widget.cardEntity.productEntity,
      );
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (widget.cardEntity.quantity > 0) {
        context.read<CartCubit>().decreaseProductQuantity(
          widget.cardEntity.productEntity,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          radius: 18,
          child: IconButton(
            icon: const Icon(Icons.add, color: Colors.white, size: 20),
            onPressed: _incrementQuantity,
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '$_quantity',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        IconButton(
          icon: const Icon(Icons.remove),
          color: Colors.grey.shade600,
          onPressed: _quantity > 0 ? _decrementQuantity : null,
        ),

        const Spacer(),

        Text(
          "${widget.cardEntity.calculateTotalPrice().toStringAsFixed(0)} جنيه",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
