import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: TextButton(
              onPressed: () {},
              child: const Icon(Icons.favorite_border, color: Colors.black),
            ),
          ),

          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Flexible(
                  child: Image(
                    image: getProductImage(productEntity.imageUrl),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          size: 50,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  title: Text(
                    productEntity.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${productEntity.price} جنيه",
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text: "/",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontFamily: 'Cairo',
                          ),
                        ),
                        TextSpan(
                          text: productEntity.unitAmount.toString(),
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontFamily: 'Cairo',
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const TextSpan(
                          text: 'كيلو',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: const CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

ImageProvider getProductImage(String? imageUrl) {
  if (imageUrl == null || imageUrl.isEmpty) {
    return const AssetImage("assets/images/placeholder.png"); 
  }

  if (imageUrl.startsWith("http")) {
    return NetworkImage(imageUrl);
  }

  return AssetImage(imageUrl);
}
