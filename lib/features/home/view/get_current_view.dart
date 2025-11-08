import 'package:e_commerce/features/home/view/card_view.dart';
import 'package:e_commerce/features/home/view/widgets/product_view.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/features/home/view/home_view.dart';

List<Widget> getCurrentView() {
  return const [HomeView(), ProductView(), CartView()];
}
