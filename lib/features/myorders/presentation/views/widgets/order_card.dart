import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/features/myorders/domian/models/order_ui_model.dart';
import 'package:e_commerce/features/myorders/presentation/views/widgets/order_header_section.dart';
import 'package:e_commerce/features/myorders/presentation/views/widgets/order_summery_section.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});

  final OrderUiModel order;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              OrderHeaderSection(order: order),
              const SizedBox(height: 16),
              OrderSummarySection(order: order),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
