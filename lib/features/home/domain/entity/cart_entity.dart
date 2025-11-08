import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/features/home/domain/entity/car_item_entity.dart';

class CartEntity {
  final List<CarItemEntity> carItem;

  CartEntity({required this.carItem});
  addProduct(CarItemEntity carItemEntity) {
    carItem.add(carItemEntity);
  }

  bool isExist(ProductEntity product) {
    for (var item in carItem) {
      if (item.productEntity == product) {
        return true;
      }
    }
    return false;
  }

  CarItemEntity getCarItemByProduct(ProductEntity product) {
    for (var item in carItem) {
      if (item.productEntity == product) {
        return item;
      }
    }
    return CarItemEntity(productEntity: product, count: 1);
  }

  double calculateTotalPrice() {
    double total = 0;
    for (var item in carItem) {
      total += item.calculateTotalPrice();
    }
    return total;
  }
  removeCarItem(CarItemEntity carItemEntity) {
    carItem.remove(carItemEntity);
  }
}
