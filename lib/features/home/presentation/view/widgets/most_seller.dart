import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/features/best_selling/presentation/views/best_selling_view.dart';
import 'package:flutter/material.dart';

class MostSeller extends StatelessWidget {
  const MostSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'الأكثر مبيعاً',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, BestSellingView.routeName);
          },
          child: Text(
            "عرض المزيد",
            style: TextStyle(
              color: AppColors.shadeColor,
              fontSize: 14,
              fontFamily: 'Cairo',
            ),
          ),
        ),
      ],
    );
  }
}
