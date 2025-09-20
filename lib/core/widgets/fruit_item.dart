import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/core/utiles/flutter_assets.dart';
import 'package:flutter/material.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

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
            top: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Image.asset(Assets.imagesItem),
                const SizedBox(height: 20),
                const ListTile(
                  title: Text(
                    "بطيخ",
                    style: TextStyle(
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
                          text: "20 جنيه",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "/",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontFamily: 'Cairo',
                          ),
                        ),
                        TextSpan(
                          text: '',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontFamily: 'Cairo',
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        TextSpan(
                          text: "الكيلو",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: CircleAvatar(
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
