import 'package:e_commerce/features/home/view/get_current_view.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/features/home/domain/entity/buttom_navigation_entity.dart';
import 'package:e_commerce/features/home/view/widgets/navigation_bar_item.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
static const String routeName = "mainView";
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final views = getCurrentView();

    return Scaffold(
      body: IndexedStack(index: currentIndex, children: views),
      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(buttomNavigationItems.length, (index) {
            final item = buttomNavigationItems[index];
            return GestureDetector(
              onTap: () {
                setState(() => currentIndex = index);
              },
              child: NavigationBarItem(
                isSelected: currentIndex == index,
                navigationEntity: item,
              ),
            );
          }),
        ),
      ),
    );
  }
}
