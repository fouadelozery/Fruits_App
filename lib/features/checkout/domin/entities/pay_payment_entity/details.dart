import 'package:e_commerce/features/checkout/domin/entities/order_entity.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };
  factory DetailsEntity.fromEntity(OrderInputEntity orderEntity) {
    return DetailsEntity(
      subtotal: orderEntity.cartEntity.calculateTotalPrice().toString(),
      shipping: orderEntity.calculateShippingCost().toString(),
      shippingDiscount: orderEntity.calculateShippingDiscount().toInt(),
    );
  }
}
