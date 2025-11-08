import 'package:e_commerce/core/helper/step_title.dart';
import 'package:e_commerce/core/widgets/custtom_buttom.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_page_view.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:flutter/material.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});
  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 16),
          const CheckoutSteps(),
          Expanded(child: CheckoutPageView(pageController: pageController)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CusttomButtom(text: "التالي", onPressed: () {}),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * .02),
        ],
      ),
    );
  }
}
