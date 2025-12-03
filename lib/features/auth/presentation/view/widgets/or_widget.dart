import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.shadeColor, thickness: 1)),
        const SizedBox(width: 18),
        const Text(
          "او",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Cairo',
          ),
        ),
        const SizedBox(width: 18),
        Expanded(child: Divider(color: AppColors.shadeColor, thickness: 1)),
      ],
    );
  }
}
