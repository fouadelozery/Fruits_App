import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';

class UnSelectedShipping extends StatelessWidget {
  const UnSelectedShipping({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.all(8.0),
      decoration: ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(color: Colors.grey.shade300, width: 1.0),
        ),
        color: Colors.white,
      ),
    );
  }
}
