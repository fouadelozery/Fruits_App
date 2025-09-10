import 'package:flutter/material.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key, required this.onchanged});

  final ValueChanged<bool> onchanged;

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  bool isChecked = false; //

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(14, 0),
      child: Row(
        children: [
          Transform.scale(
            scale: 1.3,
            child: Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value ?? false; // update local variable
                });
                widget.onchanged(isChecked); // notify parent if needed
              },
            ),
          ),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "أوافق على ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Cairo',
                  ),
                ),
                TextSpan(
                  text: "الشروط والأحكام",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
