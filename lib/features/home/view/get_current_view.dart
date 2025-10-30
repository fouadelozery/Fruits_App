import 'package:e_commerce/features/home/view/widgets/product_view.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/features/home/view/widgets/home_view.dart';

List<Widget> getCurrentView() {
  return const [
    HomeView(),   // الرئيسية
    ProductView(), // المنتجات
    Center(child: Text("عربة التسوق")), // Temporary Cart Screen
    Center(child: Text("الحساب")),      // Temporary Profile Screen
  ];
}
