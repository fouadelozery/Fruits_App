import 'package:e_commerce/core/entities/product_entity.dart';

class CarItemEntity {
  final ProductEntity productEntity;
  int quantity;

  CarItemEntity({required this.productEntity, this.quantity = 0});
  num calculateTotalPrice() {
    return productEntity.price * quantity;
  }

  num calcultateTotalWeight() {
    return productEntity.unitAmount * quantity;
  }
}
