import 'package:e_commerce/features/home/view/widgets/feature_item.dart';
import 'package:flutter/material.dart';

class FeatureList extends StatelessWidget {
  const FeatureList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        ...List.generate(5, (index) {
          return const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: FeatureItem(),
          );
        })
      ]),
    );
  }
}
