import 'package:e_commerce/features/home/domain/entity/buttom_navigation_entity.dart';
import 'package:e_commerce/features/home/view/widgets/navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomButtomBar extends StatefulWidget {
  const CustomButtomBar({super.key});

  @override
  State<CustomButtomBar> createState() => _CustomButtomBarState();
}

int selectedIndex = 0;

class _CustomButtomBarState extends State<CustomButtomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 350,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            spreadRadius: 0,
            blurRadius: 25,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          ...buttomNavigationItems.asMap().entries.map((e) {
            var index = e.key;
            var entity = e.value;
            return Expanded(
              flex: index == selectedIndex ? 3 : 2,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    border:
                        selectedIndex == index
                            ? const Border(
                              top: BorderSide(color: Colors.blue, width: 3),
                            )
                            : null,
                  ),
                  child: AnimatedScale(
                    scale: selectedIndex == index ? 1.2 : 1.0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutBack,
                    child: NavigationBarItem(
                      isSelected: selectedIndex == index,
                      navigationEntity: entity,
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
