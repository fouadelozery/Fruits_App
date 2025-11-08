import 'package:e_commerce/core/helper/step_title.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/select_item.dart';

import 'package:flutter/material.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(stepTitle().length, (index) {
          return Expanded(
            child: SelectItem(
              stepNumber: (index + 1).toString(),
              text: stepTitle()[index],
              isSelected: false,
            ),
          );
        }),
      ],
    );
  }


}
