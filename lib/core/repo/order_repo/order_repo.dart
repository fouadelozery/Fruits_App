import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/checkout/domin/entities/order_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, void>> addOrder({required OrderEntity order});
}
