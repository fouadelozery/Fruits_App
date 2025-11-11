import 'package:e_commerce/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:flutter/material.dart';

class Shipping extends StatelessWidget {
  const Shipping({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 36),
        ShippingItem(
          title: "الدفع عند الاستلام",
          subtitle: "الدفع نقدًا عند استلام الطلب",
          price: 40.0, isSelected: false,
        ),      SizedBox(height: 20),

        ShippingItem(
          title: "الدفع عبر الإنترنت",
          subtitle: "الدفع عبر الإنترنت باستخدام بطاقة الائتمان",
          price: 20.0, isSelected: true,
        ),
      ],
    );
  }
}
