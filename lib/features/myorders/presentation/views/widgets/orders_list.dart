import 'package:e_commerce/features/myorders/domian/models/order_ui_model.dart';
import 'package:e_commerce/features/myorders/presentation/views/widgets/order_card.dart';
import 'package:flutter/material.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key, required this.orders});

  final List<OrderUiModel> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        return OrderCard(order: orders[index]);
      },
    );
  }
}
