import 'package:e_commerce/features/best_selling/presentation/views/widgets/best_selling_view_body.dart';
import 'package:e_commerce/features/home/view/widgets/build_appbar.dart';
import 'package:flutter/material.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = '/best_selling_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(title: 'الأكثر مبيعاً', isBackVisible: false),
      backgroundColor: Colors.white,
      body: const BestSellingViewBody(),
    );
  }
}
