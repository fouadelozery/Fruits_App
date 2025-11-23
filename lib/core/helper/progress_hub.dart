import 'package:flutter/material.dart';

class ProgressHud extends StatelessWidget {
  final bool isLoading;
  final String? text;

  const ProgressHud({super.key, required this.isLoading, this.text});

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return const SizedBox.shrink();

    return Stack(
      children: [
        // Dim background (blocks touch)
        const Opacity(
          opacity: 0.4,
          child: ModalBarrier(dismissible: false, color: Colors.black),
        ),

        // HUD box
        Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(color: Colors.white),
                if (text != null) ...[
                  const SizedBox(height: 10),
                  Text(text!, style: const TextStyle(color: Colors.white)),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
