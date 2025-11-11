import 'package:flutter/material.dart';

class UnselectedStepItem extends StatelessWidget {
  const UnselectedStepItem({
    super.key,
    required this.stepNumber,
    required this.text,
  });
  final String stepNumber;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: Colors.grey.shade100,
          child: Text(
            stepNumber,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
            color: Color.fromARGB(255, 121, 97, 209),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
