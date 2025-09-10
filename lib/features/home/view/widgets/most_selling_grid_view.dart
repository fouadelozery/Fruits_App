import 'package:e_commerce/core/widgets/fruit_item.dart';
import 'package:flutter/material.dart';

class MostSellingGridView extends StatelessWidget {
  const MostSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 16,
        childAspectRatio: 163/214,
      ),
      itemBuilder: (context, index) {
        return const FruitItem();
      },
    );
  }
}
