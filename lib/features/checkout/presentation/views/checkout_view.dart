import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:e_commerce/features/home/view/widgets/build_appbar.dart';
import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static const String routeName = "checkoutView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(title: "الشحن", isNotificationVisible: false),
      body: const SafeArea(child:  CheckoutViewBody()),
    );
  }
}
