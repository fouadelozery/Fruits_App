import 'package:e_commerce/features/checkout/domin/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/domin/models/addressing_shipping_model.dart';
import 'package:e_commerce/features/checkout/domin/models/order_product_model.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  final double price;
  final String uId;
  final AddressingShippingModel addressingShippingModel;
  final List<OrderProductModel> orderProduct;
  final String payMethods;
  final String orderId;

  OrderModel({
    required this.price,
    required this.uId,
    required this.addressingShippingModel,
    required this.orderProduct,
    required this.payMethods,
    required this.orderId,
  });

  factory OrderModel.fromEntity(OrderInputEntity order) {
    return OrderModel(
      price: order.cartEntity.calculateTotalPrice(),
      uId: order.uId,
      addressingShippingModel: AddressingShippingModel.fromEntity(
        order.addressingShippingEntity,
        orderID: order.uId, // <- Assign a value here
      ),
      orderProduct:
          order.cartEntity.carItem
              .map((e) => OrderProductModel.fromEntity(e))
              .toList(),
      payMethods: (order.payByCash ?? false) ? 'cash' : 'online',
      orderId: const Uuid().v4(), // <- Must call v4() as a function
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'uId': uId,
      'status': "pending",
      'date': DateTime.now().toIso8601String(),
      'addressingShippingModel': addressingShippingModel.toJson(),
      'orderProduct': orderProduct.map((product) => product.tojson()).toList(),
      'payMethods': payMethods,
      'orderId': orderId,
    };
  }
}
