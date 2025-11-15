import 'package:e_commerce/features/checkout/domin/entities/addressing_shipping_entity.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/address_shipping_section.dart';
import 'package:e_commerce/features/home/domain/entity/car_item_entity.dart';

abstract class OrderEntity {
  final List<CarItemEntity> carItems;
  final bool payByCach;
  final AddressingShippingEntity addressingShippingEntity;
  OrderEntity({
    required this.carItems,
    required this.payByCach,
    required this.addressingShippingEntity,
  });
}
