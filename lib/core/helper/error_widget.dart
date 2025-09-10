import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';

void errorWidget(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), backgroundColor: AppColors.primaryColor),
  );
}
