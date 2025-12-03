import 'package:e_commerce/features/home/domain/entity/buttom_navigation_entity.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/active_item.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/in_active_item.dart';
import 'package:flutter/material.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.navigationEntity,
  });
  final bool isSelected;
  final ButtomNavigationEntity navigationEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
          image: navigationEntity.activeImage,
          name: navigationEntity.name,
        )
        : InActiveItem(image: navigationEntity.inActiveImage);
  }
}
