import 'package:e_commerce/features/checkout/domin/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/domin/models/addressing_shipping_model.dart';
import 'package:e_commerce/features/checkout/domin/models/order_product_model.dart';

class OrderModel {
  final double price;
  final String uId;
  final AddressingShippingModel addressingShippingModel;
  final List<OrderProductModel> orderProduct;
  final String payMethods;

  OrderModel({
    required this.price,
    required this.uId,
    required this.addressingShippingModel,
    required this.orderProduct,
    required this.payMethods,
  });
  factory OrderModel.fromEntity(OrderInputEntity order) {
    return OrderModel(
      price: order.cartEntity.calculateTotalPrice(),
      uId: order.uId,
      addressingShippingModel: AddressingShippingModel.fromEntity(
        order.addressingShippingEntity,
      ),
      orderProduct:
          order.cartEntity.carItem
              .map((e) => OrderProductModel.fromEntity(e))
              .toList(),
      payMethods: (order.payByCash ?? false) ? 'cach' : 'online',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'uId': uId,
      "states": "pending",
      "data": DateTime.now().toString(),
      'addressingShippingModel': addressingShippingModel.toJson(),
      'orderProduct': orderProduct.map((product) => product.tojson()).toList(),
      'payMethods': payMethods,
    };
  }
}
