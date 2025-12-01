import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/features/home/domain/entity/cart_entity.dart';

class ProductDetailsArguments {
  final ProductEntity product;
  final CartEntity cart;

  ProductDetailsArguments({required this.product, required this.cart});
}
