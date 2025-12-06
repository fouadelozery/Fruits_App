import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/helper/snackbar_method.dart';
import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/features/home/presentation/cubits/card_cubit/cart_cubit.dart';
import 'package:e_commerce/features/product_details/presentation/views/widgets/feature_grid.dart';
import 'package:e_commerce/features/product_details/presentation/views/widgets/product_description.dart';
import 'package:e_commerce/features/product_details/presentation/views/widgets/product_header_and_quantity.dart';
import 'package:e_commerce/features/product_details/presentation/views/widgets/product_image_and_appbar.dart';
import 'package:e_commerce/features/product_details/presentation/views/widgets/product_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailViewBody extends StatefulWidget {
  final ProductEntity product;

  const ProductDetailViewBody({super.key, required this.product});

  @override
  State<ProductDetailViewBody> createState() => _ProductDetailViewBodyState();
}

class _ProductDetailViewBodyState extends State<ProductDetailViewBody> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      context.read<CartCubit>().addProductToCart(widget.product);
    });
    _quantity++;
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        context.read<CartCubit>().removeProductFromCart(widget.product);
        _quantity--;
      });
    }
  }

  @override
  void initState() {
    context.read<CartCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 110),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImageAndAppBar(imageUrl: product.imageUrl ?? ""),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    ProductHeaderAndQuantity(
                      name: product.name,
                      price: (product.price).toDouble(),
                      quantity: _quantity,
                      onAdd: _incrementQuantity,
                      onRemove: _decrementQuantity,
                    ),
                    const SizedBox(height: 15),
                    ProductRatingRow(
                      rating: (product.averageRating).toDouble(),
                      reviews: product.reviews,
                    ),
                    const SizedBox(height: 20),
                    ProductDescription(description: product.description),
                    const SizedBox(height: 30),
                  ],
                ),
              ),

              FeaturesGrid(
                product: product,
                organic: product.isOrginic,
                expire: product.expireByMonth,
                rating: (product.averageRating).toDouble(),
                ratingCount: product.ratingCount,
                calories: product.numOfCalories,
              ),
            ],
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: _buildAddToCartButton(),
        ),
      ],
    );
  }

  Widget _buildAddToCartButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 55),
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
        ),
        onPressed: () {
          context.read<CartCubit>().addProductToCart(widget.product);
          snackBarMethod(
            context,
            'تم إضافة $_quantity من ${widget.product.name} إلى السلة.',
          );
        },
        child: const Text(
          'أضف الي السلة',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
