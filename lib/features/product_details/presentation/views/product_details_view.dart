import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/build_appbar.dart';
import 'package:e_commerce/features/product_details/presentation/views/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  static const String routeName = "ProductDetails";
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(
        title: "محتوي المنتج",
        isBackVisible: true,
        onPressed: () {
          return Navigator.pop(context);
        },
      ),

      body: ProductDetailViewBody(product: product),
    );
  }
}
