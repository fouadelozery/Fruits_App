import 'package:e_commerce/features/home/view/cart_view.dart';
import 'package:e_commerce/features/home/view/widgets/product_view.dart';
import 'package:e_commerce/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/features/home/view/home_view.dart';

List<Widget> getCurrentView() {
  return const [HomeView(), ProductView(), CartView(), ProfileView()];
}
