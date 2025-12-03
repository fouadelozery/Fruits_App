import 'package:e_commerce/features/checkout/domin/entities/addressing_shipping_entity.dart';

class AddressingShippingModel {
  String? fullName;
  String? phoneNumber;
  String? address;
  String? city;
  String? email;
  String? floor;

  AddressingShippingModel({
    this.fullName,
    this.phoneNumber,
    this.address,
    this.city,
    this.email,
    this.floor,
  });
  @override
  String toString() {
    return '$address $city $floor';
  }

  factory AddressingShippingModel.fromEntity(
    AddressingShippingEntity entity, {
    required orderID,
  }) {
    return AddressingShippingModel(
      address: entity.address,
      fullName: entity.fullName,
      phoneNumber: entity.phoneNumber,
      email: entity.email,
      city: entity.city,
      floor: entity.floor,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'address': address,
      'city': city,
      'email': email,
      'floor': floor,
    };
  }
}
