import 'package:e_commerce/features/home/view/widgets/custom_buttom_bar.dart';
import 'package:e_commerce/features/home/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'home_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomButtomBar(),
      backgroundColor: Colors.white,
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
