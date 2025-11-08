
import 'package:e_commerce/core/helper/step_title.dart';
import 'package:flutter/material.dart';

class CheckoutPageView extends StatelessWidget {
  const CheckoutPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stepTitle().length,
      itemBuilder: (context, index) {
        return const SizedBox.shrink();
      },
    );
  }
}
