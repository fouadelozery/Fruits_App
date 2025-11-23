import 'package:e_commerce/features/home/domain/entity/car_item_entity.dart';

class OrderProductModel {
  final String name;
  final String imageUrl;
  final String code;
  final num price;
  final int quantity;

  OrderProductModel({
    required this.name,
    required this.imageUrl,
    required this.code,
    required this.price,
    required this.quantity,
  });

  factory OrderProductModel.fromEntity(CarItemEntity carItemEntity) {
    return OrderProductModel(
      name: carItemEntity.productEntity.name,
      imageUrl: carItemEntity.productEntity.imageUrl!,
      code: carItemEntity.productEntity.code,
      price: carItemEntity.productEntity.price,
      quantity: carItemEntity.quantity,
    );
  }
  Map<String, dynamic> tojson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'code': code,
      'price': price,
      'quantity': quantity,
    };
  }
}
