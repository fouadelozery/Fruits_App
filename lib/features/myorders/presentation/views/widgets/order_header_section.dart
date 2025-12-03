import 'dart:ui';

import 'package:e_commerce/features/myorders/domian/models/order_ui_model.dart';
import 'package:e_commerce/features/myorders/presentation/views/widgets/order_icon.dart';
import 'package:e_commerce/features/myorders/presentation/views/widgets/order_status_view.dart';
import 'package:e_commerce/features/myorders/presentation/views/widgets/order_title_and_data.dart';
import 'package:flutter/material.dart';

class OrderHeaderSection extends StatelessWidget {
  const OrderHeaderSection({super.key, required this.order});

  final OrderUiModel order;

  String _formatDate(DateTime date) {
    final d =
        "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
    final t =
        "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";
    return "$d  •  $t";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const OrderIcon(),
        const SizedBox(width: 12),
        Expanded(
          child: OrderTitleAndDate(
            orderId: order.orderId,
            dateText: order.date != null ? _formatDate(order.date!) : null,
          ),
        ),
        OrderStatusView(status: order.status),
      ],
    );
  }
}
