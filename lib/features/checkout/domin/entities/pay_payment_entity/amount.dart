import 'package:e_commerce/core/helper/get_currency.dart';
import 'package:e_commerce/features/checkout/domin/entities/order_entity.dart';
import 'details.dart';

class AmountEntity {
  String? total;
  String? currency;
  DetailsEntity? details;

  AmountEntity({this.total, this.currency, this.details});

  Map<String, dynamic> toJson() => {
    "total": total,
    "currency": currency,
    "details": details?.toJson(),
  };

  factory AmountEntity.fromEntity(OrderInputEntity orderEntity) {
    return AmountEntity(
      total:
          orderEntity.calculateTotalPriceAfterShippingAndDidcount().toString(),
      currency: getCurrency(),
      details: DetailsEntity.fromEntity(orderEntity),
    );
  }
}
