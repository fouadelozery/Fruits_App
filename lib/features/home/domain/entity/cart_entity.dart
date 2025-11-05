import 'package:e_commerce/features/home/domain/entity/car_entity.dart';

class CartEntity {
 final   List<CarItemEntity> carItem;

  CartEntity({required this.carItem});
  addItemCart(CarItemEntity carItemEntity){
    carItem.add(carItemEntity);
  }
}
