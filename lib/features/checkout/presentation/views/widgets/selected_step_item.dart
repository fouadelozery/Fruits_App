import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';

class SelectedStepItem extends StatelessWidget {
  const SelectedStepItem({
    super.key,
    required this.stepNumber,
    required this.text,
  });
  final String stepNumber;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: AppColors.primaryColor,
          child: const Icon(Icons.check, color: Colors.white, size: 16),
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
