import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';

class SelectedShipping extends StatelessWidget {
  const SelectedShipping({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.all(8.0),
      decoration: const ShapeDecoration(
        shape: OvalBorder(side: BorderSide(color: Colors.grey, width: 1.0)),
        color: Colors.white,
      ),
      child: Container(
        width: 20,
        height: 20,
        margin: const EdgeInsets.all(8.0),
        decoration: ShapeDecoration(
          shape: OvalBorder(
            side: BorderSide(color: AppColors.primaryColor, width: 6.5),
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}
