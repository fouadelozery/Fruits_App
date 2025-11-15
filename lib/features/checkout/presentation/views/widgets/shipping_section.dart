import 'package:e_commerce/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:flutter/material.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedShippingIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 36),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedShippingIndex = 0;
            });
          },
          title: "الدفع عند الاستلام",
          subtitle: "الدفع نقدًا عند استلام الطلب",
          price: 40.0,
          isSelected: selectedShippingIndex == 0,
        ),
        SizedBox(height: 20),

        ShippingItem(
          onTap: () {
            setState(() {
              selectedShippingIndex = 1;
            });
          },
          title: "الدفع عبر الإنترنت",
          subtitle: "الدفع عبر الإنترنت باستخدام بطاقة الائتمان",
          price: 20.0,
          isSelected: selectedShippingIndex == 1,
        ),
      ],
    );
  }
}
