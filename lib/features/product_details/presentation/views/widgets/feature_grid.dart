import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';

class FeaturesGrid extends StatelessWidget {
  final bool organic;
  final int expire;
  final double rating;
  final int ratingCount;
  final int calories;

  const FeaturesGrid({
    super.key,
    required this.organic,
    required this.expire,
    required this.rating,
    required this.ratingCount,
    required this.calories,
    required ProductEntity product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 2.5,
        children: [
          _item(Icons.nature_people, organic.toString(), 'أورجانيك'),
          _item(Icons.date_range, expire.toString(), 'الصلاحية'),
          _item(Icons.star, "$rating ($ratingCount)", 'Reviews'),
          _item(Icons.local_fire_department, "$calories كالوري", '100 جرام'),
        ],
      ),
    );
  }

  Widget _item(IconData icon, String value, String label) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              Icon(icon, color: Colors.white, size: 24),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
