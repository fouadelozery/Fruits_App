import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/features/home/domain/entity/car_item_entity.dart';
import 'package:e_commerce/features/home/view/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartViewList extends StatelessWidget {
  const CartViewList({super.key, required this.cardItem});
  final List<CarItemEntity> cardItem;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CartItem(
            cardEntity: cardItem[index],
            cartEntityItem: cardItem[index],
          ),
        );
      },
      itemCount: cardItem.length,
      separatorBuilder:
          (context, index) => const Divider(
            color: AppColors.shadeColor,
            thickness: 0.5,
            height: 16,
            endIndent: 72,
            indent: 72,
          ),
    );
  }
}
