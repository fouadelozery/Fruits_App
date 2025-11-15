import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';

void snackBarMethod(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.primaryColor,
      content: Center(
        child: Text(
          message,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      duration: const Duration(microseconds: 200),
    ),
  );
}
