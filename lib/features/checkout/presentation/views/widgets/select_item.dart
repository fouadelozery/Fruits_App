import 'package:e_commerce/features/checkout/presentation/views/widgets/selected_step_item.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/unselected_step_item.dart';
import 'package:flutter/material.dart';

class SelectItem extends StatelessWidget {
  const SelectItem({
    super.key,
    required this.stepNumber,
    required this.text,
    required this.isSelected,
  });

  final String stepNumber;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: SelectedStepItem(stepNumber: stepNumber, text: text),
      secondChild: UnselectedStepItem(stepNumber: stepNumber, text: text),
      crossFadeState:
          isSelected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 250),
      sizeCurve: Curves.easeInOut,
    );
  }
}
