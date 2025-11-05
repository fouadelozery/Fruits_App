import 'dart:developer';

import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/widgets/fruit_item.dart';
import 'package:flutter/material.dart';

class MostSellingGridView extends StatelessWidget {
  const MostSellingGridView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {

    log("------------------"+ products[0].name);
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 16,
        childAspectRatio: 163 / 214,
      ),
      itemBuilder: (context, index) {
        return FruitItem(productEntity: products[index]);
      },
    );
  }
}
