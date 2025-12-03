import 'package:flutter/material.dart';

class OrderTitleAndDate extends StatelessWidget {
  const OrderTitleAndDate({super.key, required this.orderId, this.dateText});

  final String orderId;
  final String? dateText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 4),
        Text(
          'طلب #$orderId',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        if (dateText != null) ...[
          const SizedBox(height: 8),
          Text(
            dateText!,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ],
    );
  }
}
