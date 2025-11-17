import 'package:e_commerce/features/checkout/domin/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  int selectedShippingIndex = 0;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        const SizedBox(height: 36),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedShippingIndex = 0;
            });
          },
          title: "الدفع عند الاستلام",
          subtitle: "الدفع نقدًا عند استلام الطلب",
          price:
              (context.read<OrderEntity>().cartEntity.calculateTotalPrice()) +
              2,
          isSelected: selectedShippingIndex == 0,
        ),
        const SizedBox(height: 20),

        ShippingItem(
          onTap: () {
            setState(() {
              selectedShippingIndex = 1;
            });
          },
          title: "الدفع عبر الإنترنت",
          subtitle: "الدفع عبر الإنترنت باستخدام بطاقة الائتمان",
          price: context.read<OrderEntity>().cartEntity.calculateTotalPrice(),

          isSelected: selectedShippingIndex == 1,
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
