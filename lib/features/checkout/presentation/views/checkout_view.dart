import 'package:e_commerce/features/checkout/domin/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:e_commerce/features/home/domain/entity/car_item_entity.dart';
import 'package:e_commerce/features/home/domain/entity/cart_entity.dart';
import 'package:e_commerce/features/home/view/widgets/build_appbar.dart';
import 'package:e_commerce/features/home/view/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const String routeName = "checkoutView";
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildappbar(title: "الشحن", isNotificationVisible: false),
      body: SafeArea(
        child: Provider.value(
          value: OrderEntity(cartEntity),
          child: const CheckoutViewBody(),
        ),
      ),
    );
  }
}
