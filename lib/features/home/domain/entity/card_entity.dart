import 'package:e_commerce/core/entities/product_entity.dart';

class CardEntity {
  final ProductEntity productEntity;
  int count;

  CardEntity({required this.productEntity, this.count = 0});
  num calculateTotalPrice() {
    return productEntity.price * count;
  }

  num calcultateTotalWeight() {
    return productEntity.unitAmount * count;
  }
}
