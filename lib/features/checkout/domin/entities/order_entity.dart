import 'package:e_commerce/features/checkout/domin/entities/addressing_shipping_entity.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/address_shipping_section.dart';
import 'package:e_commerce/features/home/domain/entity/car_item_entity.dart';
import 'package:e_commerce/features/home/domain/entity/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool? payByCach;
  AddressingShippingEntity? addressingShippingEntity;
  OrderEntity(this.cartEntity, {this.payByCach, this.addressingShippingEntity});
}
