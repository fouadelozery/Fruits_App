import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';

class FiltterSection extends StatelessWidget {
  const FiltterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_b_and_w_sharp),
        ),
        const Text(
          "Filter",
          style: TextStyle(
            fontFamily: "Cairo",
            fontSize: 26,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
