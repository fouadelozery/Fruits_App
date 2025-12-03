import 'package:e_commerce/features/myorders/domian/models/order_ui_model.dart';
import 'package:e_commerce/features/myorders/presentation/views/widgets/order_payment_methods.dart';
import 'package:e_commerce/features/myorders/presentation/views/widgets/order_total.dart';
import 'package:flutter/material.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({super.key, required this.order});

  final OrderUiModel order;

  String payMethodLabel(String method) {
    switch (method.toLowerCase()) {
      case 'cash':
        return 'الدفع عند الاستلام';
      case 'paypal':
        return 'PayPal';
      default:
        return method;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OrderTotal(price: order.price),
        const SizedBox(width: 4),
        OrderPaymentMethod(
          method: order.payMethod,
          label: payMethodLabel(order.payMethod),
        ),
      ],
    );
  }
}
