import 'package:e_commerce/features/checkout/domin/entities/addressing_shipping_entity.dart';

import 'package:e_commerce/features/home/domain/entity/cart_entity.dart';

class OrderEntity {
  final String uId;
  final CartEntity cartEntity;
  bool? payByCash;
  AddressingShippingEntity addressingShippingEntity =
      AddressingShippingEntity();
  OrderEntity(this.cartEntity, {this.payByCash, required this.uId});
}
