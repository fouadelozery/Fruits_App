import 'dart:developer';

import 'package:e_commerce/core/helper/snackbar_method.dart';
import 'package:e_commerce/core/utiles/app_key.dart';
import 'package:e_commerce/core/widgets/custtom_buttom.dart';
import 'package:e_commerce/features/checkout/domin/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/domin/entities/pay_payment_entity/pay_payment_entity.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_page_view.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:provider/provider.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );

  int currentPageNumber = 0;
  final GlobalKey<FormState> globalKey = GlobalKey();

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageNumber = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 16),
          CheckoutSteps(
            pageController: pageController,
            currentStep: currentPageNumber,
          ),
          Expanded(
            child: CheckoutPageView(
              pageController: pageController,
              globalKey: globalKey,
              valueListenable: valueNotifier,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CusttomButtom(
              text: currentPageNumber == 2 ? "ادفع" : "التالي",
              onPressed: () {
                if (currentPageNumber == 0) {
                  _handleShippingValidation();
                } else if (currentPageNumber == 1) {
                  _handleAddressingValidation();
                } else {
                  _handlePayment();
                }
              },
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * .02),
        ],
      ),
    );
  }

  void _handleShippingValidation() {
    pageController.animateToPage(
      currentPageNumber + 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _handleAddressingValidation() {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      pageController.animateToPage(
        currentPageNumber + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void _handlePayment() {
    var orderEntity = context.read<OrderEntity>();
    PayPaymentEntity payPaymentEntity = PayPaymentEntity.fromEntity(
      orderEntity,
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: clientId,
              secretKey: secretKey,

              transactions: [payPaymentEntity.toJson()],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                Navigator.pop(context);
                snackBarMethod(context, "تم الدفع بنجاح")
              },
              onError: (error) {
                Navigator.pop(context);
                log(error.toString());
              },
              onCancel: () {
                Navigator.pop(context);
              },
            ),
      ),
    );
  }
}
