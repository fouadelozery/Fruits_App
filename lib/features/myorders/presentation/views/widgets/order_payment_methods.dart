import 'package:flutter/material.dart';

class OrderPaymentMethod extends StatelessWidget {
  const OrderPaymentMethod({
    super.key,
    required this.method,
    required this.label,
  });

  final String method;
  final String label;

  @override
  Widget build(BuildContext context) {
    final isPaypal = method.toLowerCase() == 'paypal';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'طريقة الدفع',
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isPaypal
                  ? Icons.account_balance_wallet_outlined
                  : Icons.payments_outlined,
              size: 18,
              color: Colors.white,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
