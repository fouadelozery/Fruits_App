import 'package:e_commerce/core/helper/step_title.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/address_shipping_section.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/shipping_section.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CheckoutPageView extends StatelessWidget {
  const CheckoutPageView({
    super.key,
    required this.pageController,
    required this.globalKey,
    required this.valueListenable,
  });

  final PageController pageController;
  final GlobalKey<FormState> globalKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: getPages().length,
      itemBuilder: (context, index) {
        return getPages()[index];
      },
    );
  }

  List<Widget> getPages() {
    return [
      const ShippingSection(),
      AddressShippingSection(
        globalKey: globalKey,
        valueListenable: valueListenable,
      ),
      const PaymentSection(),
    ];
  }
}
