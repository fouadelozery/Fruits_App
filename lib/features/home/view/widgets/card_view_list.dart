import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/features/home/domain/entity/card_entity.dart';
import 'package:e_commerce/features/home/view/widgets/card_item.dart';
import 'package:flutter/material.dart';

class CardViewList extends StatelessWidget {
  const CardViewList({super.key, required this.cardItem});
  final List<CardEntity> cardItem;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CardItem(cardEntity: cardItem[index]),
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
