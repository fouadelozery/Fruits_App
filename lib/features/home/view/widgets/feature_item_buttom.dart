import 'package:flutter/material.dart';

class FeatureItemButtom extends StatelessWidget {
  const FeatureItemButtom({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,

      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        onPressed: onPressed,
        child: const FittedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'تسوق الان',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
