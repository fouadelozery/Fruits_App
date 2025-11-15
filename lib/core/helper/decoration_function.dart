import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';

ShapeDecoration mainDecoration({required bool isSelected}) {
  return ShapeDecoration(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
      side: BorderSide(
        color: isSelected ? AppColors.primaryColor : Colors.grey.shade300,
        width: 1.5,
      ),
    ),
    color: Colors.white,
  );
}
