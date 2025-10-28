import 'package:e_commerce/features/home/view/widgets/custom_buttom_bar.dart';
import 'package:e_commerce/features/home/view/widgets/home_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const routeName = 'home_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomButtomBar(),
      backgroundColor: Colors.white,
      body: SafeArea(child: HomeView()),
    );
  }
}
