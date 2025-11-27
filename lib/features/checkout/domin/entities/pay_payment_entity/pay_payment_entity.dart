import 'package:e_commerce/features/checkout/domin/entities/order_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PayPaymentEntity {
  AmountEntity? amount;
  String? description;
  ItemList? itemList;

  PayPaymentEntity({this.amount, this.description, this.itemList});
  factory PayPaymentEntity.fromEntity(OrderInputEntity entity) {
    return PayPaymentEntity(
      amount: AmountEntity.fromEntity(entity),
      description: "Payment",
      itemList: ItemList.fromEntity(items: entity.cartEntity.carItem),
    );
  }

  toJson() {
    return {
      "amount": amount?.toJson(),
      "description": description,
      "item_list": itemList?.toJson(),
    };
  }
}
