import 'package:e_commerce/features/home/presentation/cubits/card_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 16),
      color: Colors.grey,
      alignment: Alignment.center,

      child: Text(
        "لديك ${context.watch<CartCubit>().cartEntity.carItem.length} منتجات في السله",
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 0.12,
        ),
      ),
    );
  }
}
