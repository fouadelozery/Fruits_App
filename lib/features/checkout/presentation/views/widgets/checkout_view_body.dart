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
    super.dispose();
  }

  int currentPageNumber = 0;
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
          Expanded(child: CheckoutPageView(pageController: pageController)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CusttomButtom(
              text: "التالي",
              onPressed: () {
                pageController.animateToPage(
                  pageController.page!.toInt() + 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * .02),
        ],
      ),
    );
  }
}
