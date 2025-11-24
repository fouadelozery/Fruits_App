import 'package:e_commerce/core/helper/get_currency.dart';
import 'package:e_commerce/features/home/domain/entity/car_item_entity.dart';

class ItemEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };
  factory ItemEntity.fromEntity(CarItemEntity car) {
    return ItemEntity(
      name: car.productEntity.name,
      quantity: car.quantity,
      price: car.productEntity.price.toString(),
      currency: getCurrency(),
    );
  }
}
