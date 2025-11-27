import 'package:e_commerce/core/helper/step_title.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/select_item.dart';

import 'package:flutter/material.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({
    super.key,
    required this.currentStep,
    required this.pageController,
    required this.onTap,
  });
  final int currentStep;
  final PageController pageController;
  final ValueChanged onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(stepTitle().length, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                onTap(index);
              },
              child: SelectItem(
                stepNumber: (index + 1).toString(),
                text: stepTitle()[index],
                isSelected: index <= currentStep,
              ),
            ),
          );
        }),
      ],
    );
  }
}
