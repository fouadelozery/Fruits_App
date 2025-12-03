import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';

class OrdersLoading extends StatelessWidget {
  const OrdersLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}

class OrdersError extends StatelessWidget {
  const OrdersError({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('حصل خطأ: $message', textAlign: TextAlign.center),
    );
  }
}

class OrdersEmpty extends StatelessWidget {
  const OrdersEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'لا يوجد طلبات حتى الآن',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
